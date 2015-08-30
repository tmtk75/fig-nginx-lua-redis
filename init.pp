package {[
  jq,
  redis,
  vim,
  ]:
  ensure => latest,
}

service { redis:
  ensure => running
}

include nginx
