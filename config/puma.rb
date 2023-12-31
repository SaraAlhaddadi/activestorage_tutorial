# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers: a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum; this matches the default thread size of Active Record.
#
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

# Specifies the `worker_timeout` threshold that Puma will use to wait before
# terminating a worker in development environments.
#
worker_timeout 3600 if ENV.fetch("RAILS_ENV", "development") == "development"

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
#
# port ENV.fetch("PORT") { 3000 }

# Specifies the `environment` that Puma will run in.
#
# environment ENV.fetch("RAILS_ENV") { "development" }

# Specifies the `pidfile` that Puma will use.
# pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

# Specifies the number of `workers` to boot in clustered mode.
# Workers are forked web server processes. If using threads and workers together
# the concurrency of the application would be max `threads` * `workers`.
# Workers do not work on JRuby or Windows (both of which do not support
# processes).
#
# workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Use the `preload_app!` method when specifying a `workers` number.
# This directive tells Puma to first boot the application and load code
# before forking the application. This takes advantage of Copy On Write
# process behavior so workers use less memory.
#
# preload_app!

# Allow puma to be restarted by `bin/rails restart` command.

nakayoshi_fork
wait_for_less_busy_worker
fork_worker

rails_env = ENV.fetch('RAILS_ENV', 'development')
rails_port = ENV.fetch('PORT', 3002)
environment rails_env
pidfile ENV.fetch('PIDFILE', 'tmp/pids/server.pid')

if rails_env == 'development'
  ssl_bind(
    '127.0.0.1',
    rails_port,
    key: ENV.fetch('SSL_KEY_FILE', 'localbe.jisr.dev+3-key.pem'),
    cert: ENV.fetch('SSL_CERT_FILE', 'localbe.jisr.dev+3.pem'),
    verify_mode: 'none'
  )
else
  port rails_port
end

plugin :tmp_restart

preload_app!
