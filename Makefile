# Makefile

# Define the subdirectory containing the Docker Compose file
DOCKER_DIR := postgres

# Start the Docker Compose services
pg-up:
	@cd $(DOCKER_DIR) && docker-compose up -d
	@echo "\033[1;32m================================================================\033[0m"
	@echo "\033[1;33mPGAdmin and PostgreSQL are up and running!\033[0m"
	@echo "\033[1;32m================================================================\033[0m"
	@echo "\033[1;34m- Access pgAdmin at: \033[0mhttp://localhost:5050"
	@echo "\033[1;34m- Default pgAdmin Email: \033[0madmin@admin.com"
	@echo "\033[1;34m- Default pgAdmin Password: \033[0mroot"
	@echo "\033[1;32m================================================================\033[0m"
	@echo "\033[1;34m- Connect to PostgreSQL with the following credentials:\033[0m"
	@echo "\033[1;34m  - Host: \033[0mlocalhost"
	@echo "\033[1;34m  - Port: \033[0m5432"
	@echo "\033[1;34m  - Server: \033[0mdbt"
	@echo "\033[1;34m  - Database: \033[0mpostgres"
	@echo "\033[1;34m  - User: \033[0mpostgres"
	@echo "\033[1;34m  - Password: \033[0mpostgres"
	@echo "\033[1;32m================================================================\033[0m"
	@echo "\033[1;34m- For dbt, use the following:\033[0m"
	@echo "\033[1;34m  - Host: \033[0mlocalhost"
	@echo "\033[1;34m  - Port: \033[0m5432"
	@echo "\033[1;34m  - Server: \033[0mdbt"
	@echo "\033[1;34m  - Database: \033[0mexample"
	@echo "\033[1;34m  - Schema: \033[0msource"
	@echo "\033[1;34m  - User: \033[0mdbt_user"
	@echo "\033[1;34m  - Password: \033[0mpassword"
	@echo "\033[1;32m================================================================\033[0m"

# Stop the Docker Compose services
pg-down:
	cd $(DOCKER_DIR) && docker-compose down

# Check the status of the database

pg-status:
	@cd $(DOCKER_DIR) && docker-compose ps

# Clean up the persistent data
pg-clean:
	cd $(DOCKER_DIR) && docker-compose down && rm -rf ./postgres_data



# Define the virtual environment name
VENV_NAME := .venv_dbt
# Define the python interpreter
PYTHON := python3
# Define the dbt packages to be installed
DBT_PACKAGES := dbt-core dbt-postgres

# Create a virtual environment
dbt-setup:
	@$(PYTHON) -m venv $(VENV_NAME)
	@$(VENV_NAME)/bin/pip install --upgrade pip
	@$(VENV_NAME)/bin/pip install $(DBT_PACKAGES)
	@echo "To activate the virtual environment, run 'source $(VENV_NAME)/bin/activate'"

# Activate the virtual environment
dbt-activate:
	@echo "To activate the virtual environment, run 'source $(VENV_NAME)/bin/activate'"

# Deactivate the virtual environment
dbt-deactivate:
	@echo "To deactivate the virtual environment, run 'deactivate'"

# Add a clean command if you want to remove the virtual environment
dbt-clean:
	@rm -rf $(VENV_NAME)
	@echo "Virtual environment removed"
