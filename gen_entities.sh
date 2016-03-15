dbicdump -o dump_directory=./lib/LoginApp/Entities -o components='["InflateColumn::DateTime"]' LoginApp::Schema 'dbi:mysql:dbname=szilardDB' szilard secret
