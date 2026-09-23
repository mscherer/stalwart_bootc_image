A custom bootc image that install stalwart.

Various notes
=============

# OVH

In order to have a OVH key, you need to make sure the keys have access to those apis:
```
/domain/zone/example.org/record   GET
/domain/zone/example.org/record/* GET

/domain/zone/example.org/record   POST
/domain/zone/example.org/refresh  POST

/domain/zone/example.org/record/* DELETE
```

Otherwise, it result in the same error as described on https://support.stalw.art/t/zone-not-found-or-not-accessible-on-dns-update/781
