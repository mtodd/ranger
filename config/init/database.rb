# Load DB Config
Halcyon.db = Halcyon::Runner.load_config(Halcyon.paths[:config]/'database.yml')
Halcyon.db = Halcyon.db[(Halcyon.environment || :development).to_sym]
