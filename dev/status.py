import subprocess

service_name = 'minikube'

try:
    result = subprocess.run(['minikube', 'status', '--format={{.Host}}'], capture_output=True, text=True)
    
    if result.returncode == 0:
        print(f"Service '{service_name}' status: {result.stdout.strip()}")
    else:
        print(f"Command failed with return code {result.returncode}")
        print(f"Error output: {result.stderr.strip()}")

except Exception as e:
    print(f"An erorr occurred: {e}")