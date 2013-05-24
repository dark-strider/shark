worker_processes 2
timeout 30
preload_app true

working_directory '/home/ds/rails/dev/shark/'
pid '/home/ds/rails/dev/shark/tmp/pids/unicorn.pid'
stderr_path '/home/ds/rails/dev/shark/log/unicorn.log'
stdout_path '/home/ds/rails/dev/shark/log/unicorn.log'
listen '/tmp/unicorn.shark.sock'