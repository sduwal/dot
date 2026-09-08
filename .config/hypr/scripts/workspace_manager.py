import socket
import os
import subprocess
import json
import time

def get_hyprland_info(cmd):
    try:
        result = subprocess.run(['hyprctl', '-j', cmd], capture_output=True, text=True)
        return json.loads(result.stdout)
    except Exception:
        return []

def hyprctl_dispatch(cmd_str):
    subprocess.run(['hyprctl', 'dispatch', cmd_str])

def reorder_workspaces():
    try:
        clients = get_hyprland_info('clients')
        if not clients:
            return

        # Map workspace ID to list of window addresses
        ws_map = {}
        for client in clients:
            ws_id = client['workspace']['id']
            # Only handle regular workspaces (positive IDs)
            if ws_id <= 0:
                continue
            addr = client['address']
            if ws_id not in ws_map:
                ws_map[ws_id] = []
            ws_map[ws_id].append(addr)
        
        if not ws_map:
            return

        active_ws_info = get_hyprland_info('activeworkspace')
        active_ws_id = active_ws_info.get('id') if isinstance(active_ws_info, dict) else None
        
        sorted_ws_ids = sorted(ws_map.keys())
        
        target_ws = 1
        for ws_id in sorted_ws_ids:
            if ws_id != target_ws:
                # Move all windows from this workspace to the target
                for addr in ws_map[ws_id]:
                    hyprctl_dispatch(f"movetoworkspacesilent {target_ws},address:{addr}")
                
                # If we moved windows from the active workspace, follow them
                if ws_id == active_ws_id:
                    hyprctl_dispatch(f"workspace {target_ws}")
                    active_ws_id = target_ws # Update local tracking
                    
            target_ws += 1
            
    except Exception as e:
        print(f"Error in reorder_workspaces: {e}")

def main():
    signature = os.environ.get('HYPRLAND_INSTANCE_SIGNATURE')
    runtime_dir = os.environ.get('XDG_RUNTIME_DIR')
    
    if not signature or not runtime_dir:
        return

    socket_path = os.path.join(runtime_dir, 'hypr', signature, '.socket2.sock')
    
    while True:
        try:
            with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as s:
                s.connect(socket_path)
                # Initial reorder on start
                reorder_workspaces()
                
                while True:
                    data = s.recv(4096).decode('utf-8')
                    if not data:
                        break
                    
                    events = data.strip().split('\n')
                    should_reorder = False
                    for event in events:
                        # Reorder on window open, close, or move
                        if any(x in event for x in ['openwindow', 'closewindow', 'movewindow']):
                            should_reorder = True
                            break
                    
                    if should_reorder:
                        # Small delay to let Hyprland update its internal state
                        time.sleep(0.05)
                        reorder_workspaces()
        except Exception:
            # Reconnect if socket fails
            time.sleep(1)

if __name__ == "__main__":
    main()
