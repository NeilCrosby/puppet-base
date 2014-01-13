class ondrejppa {
    include apt

    apt::pparepo { "ondrej/php5":
        apt_key => "E5267A6C",
        ensure => present
    }
}

