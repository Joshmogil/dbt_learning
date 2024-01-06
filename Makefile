# Makefile

# Define the subdirectory containing the Docker Compose file
DOCKER_DIR := postgres

# Start the Docker Compose services
db-up:
	@cd $(DOCKER_DIR) && docker-compose up -d
	@echo "\033[1;32m================================================================\033[0m"
	@echo "\033[1;33mPGAdmin and PostgreSQL are up and running!\033[0m"
	@echo "\033[1;32m================================================================\033[0m"
	@echo "\033[1;34m- Access pgAdmin at: \033[0mhttp://localhost:5050"
	@echo "\033[1;34m- Default pgAdmin Email: \033[0madmin@admin.com"
	@echo "\033[1;34m- Default pgAdmin Password: \033[0mroot"
	@echo "\033[1;32m================================================================\033[0m"
	@echo "\033[1;34m- Connect to PostgreSQL with the following credentials:\033[0m"
	@echo "\033[1;34m  - Host: \033[0mhttp://localhost"
	@echo "\033[1;34m  - Port: \033[0m5432"
	@echo "\033[1;34m  - Database: \033[0mmydatabase"
	@echo "\033[1;34m  - User: \033[0mpostgres"
	@echo "\033[1;34m  - Password: \033[0mpostgres"
	@echo "\033[1;32m================================================================\033[0m"

# Stop the Docker Compose services
db-down:
	cd $(DOCKER_DIR) && docker-compose down

db-clean-volume:
	cd $(DOCKER_DIR) && docker-compose down && rm -rf ./postgres_data