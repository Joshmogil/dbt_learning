<!DOCTYPE html>
<html>
<body>

<h1>Dbt Core Learning Environment</h1>
<p>Convenience repo for setting up dbt with a basic postgres connection</p>

<h2>Description</h2>
<p>This Makefile facilitates the management of Docker Compose services for PostgreSQL and pgAdmin, as well as setting up a virtual environment for dbt (Data Build Tool) for database transformations.</p>

<h2>Prerequisites</h2>
<ul>
    <li>Docker and Docker Compose</li>
    <li>Python 3 and pip</li>
</ul>

<h2>Quick Start</h2>
<code>make pg-up                    #view pgadmin at http://localhost:5050
    make dbt-setup                  #venv with dbt-core and dbt-postgres
    source .venv_dbt/bin/activate   #activate venv
    dbt init users                  #init your first dbt project, see ./.dbt-profile-example!</code>

<p>Can sort of follow along with this guide: https://medium.com/israeli-tech-radar/first-steps-with-dbt-over-postgres-db-f6b350bf4526</p>

<h2>More Info</h2>

<h3>Docker Compose Commands</h3>

<h4>Starting PostgreSQL and pgAdmin</h4>
<code>make pg-up</code>
<p>Starts PostgreSQL server and pgAdmin in detached mode. Displays access information.</p>

<h4>Stopping PostgreSQL and pgAdmin</h4>
<code>make pg-down</code>
<p>Stops the running services.</p>

<h4>Checking the Status of the Services</h4>
<code>make pg-status</code>
<p>Displays the status of PostgreSQL and pgAdmin services.</p>

<h4>Cleaning Up Persistent Data</h4>
<code>make pg-clean</code>
<p>Stops services and removes persisted data (like PostgreSQL database files).</p>

<h3>dbt Virtual Environment Commands</h3>

<h4>Setting up the dbt Virtual Environment</h4>
<code>make dbt-setup</code>
<p>Creates a virtual environment and installs dbt packages.</p>

<h4>Deactivating the dbt Virtual Environment</h4>
<code>make dbt-deactivate</code>
<p>Prints the command to deactivate the virtual environment.</p>

<h4>Cleaning the dbt Virtual Environment</h4>
<code>make dbt-clean</code>
<p>Removes the virtual environment and its dependencies.</p>

<h2>Access Details</h2>

<h3>pgAdmin</h3>
<p><strong>URL</strong>: <a href="http://localhost:5050">http://localhost:5050</a></p>
<p><strong>Email</strong>: admin@admin.com</p>
<p><strong>Password</strong>: root</p>

<h3>PostgreSQL</h3>
<ul>
    <li><strong>Host</strong>: localhost</li>
    <li><strong>Port</strong>: 5432</li>
    <li><strong>Server</strong>: dbt</li>
    <li><strong>Database</strong>: postgres</li>
    <li><strong>User</strong>: postgres</li>
    <li><strong>Password</strong>: postgres</li>
</ul>

<h3>dbt</h3>
<ul>
    <li><strong>Host</strong>: localhost</li>
    <li><strong>Port</strong>: 5432</li>
    <li><strong>Server</strong>: dbt</li>
    <li><strong>Database</strong>: example</li>
    <li><strong>Schema</strong>: source</li>
    <li><strong>User</strong>: dbt_user</li>
    <li><strong>Password</strong>: password</li>
</ul>

<h2>Contributing</h2>
<p>Instructions for how to contribute to this project.</p>

<h2>License</h2>
<p>Specify the license under which this project is available.</p>

</body>
</html>
