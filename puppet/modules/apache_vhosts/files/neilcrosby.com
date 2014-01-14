<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    ServerName neilcrosby.com
    ServerAlias neilcrosby.dev

    DocumentRoot /var/www/neilcrosby.com/public
    <Directory />
        Options FollowSymLinks
        AllowOverride None
    </Directory>
        <Directory /var/www/neilcrosby.com/public>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride None
        Order allow,deny
        allow from all
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/neilcrosby.com-error.log

    # Possible values include: debug, info, notice, warn, error, crit,
    # alert, emerg.
    LogLevel warn

    CustomLog ${APACHE_LOG_DIR}/neilcrosby.com-access.log combined
</VirtualHost>