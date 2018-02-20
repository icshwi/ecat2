We would like to merge ecat db files into ecat2, in order to minimize any further maintanence.

DB file, so I decided to reset all history in this repository, however, the original repository should be intact as follows:


```
jhlee@kaffee: m-epics-ecat2db (master)$ git remote -v
origin  https://bitbucket.org/europeanspallationsource/m-epics-ecat2db (fetch)
origin  https://bitbucket.org/europeanspallationsource/m-epics-ecat2db (push)
```



```
jhlee@kaffee: db (master)$ git hist
* f7993ed 2018-01-23 | el2124 terminal databasefile added (HEAD, origin/master, origin/HEAD, master) [Julen Etxeberria Malkorra]
* b3279c6 2017-06-07 | add template for EL3208 RTD (tag: v0.4.3) [jfdenis]
* 5bdf448 2017-05-24 | ESLO configurable (tag: v0.4.2) [jfdenis]
* cc5acea 2016-12-05 | Script for testing record processing rate [Alexander Söderqvist]
* 16544a0 2016-12-02 | Added training startup script [Alexander Söderqvist]
* 9bf4b49 2016-11-28 | Initial commit of ecat2training startup script [Alexander Söderqvist]
* c541b02 2016-11-22 | Bugfixes to EL2502 (tag: v0.4.1) [ess-dev]
* 0ed649f 2016-11-22 | Add support: el1014, el2004. Fix macros (tag: v0.4.0) [Alexander Söderqvist]
* 387ca68 2016-11-22 | Add EL3214, EL4102, EL4122 [Niklas]
* 63a7ce5 2016-11-22 | Add support for EL2502, EL3202 [Niklas]
* 95be8c5 2016-11-22 | Changed name of DTYP slave macro to DEVNAME [Alexander Söderqvist]
* 83c8001 2016-11-22 | Fix el3602 [Alexander Söderqvist]
* 241c563 2016-11-22 | Added el3602 [Alexander Söderqvist]
* c277b9e 2016-10-26 | Fixed scaling of el4134 and added drvh drvl. (tag: v0.3.2) [Alexander Söderqvist]
* 4458e24 2016-10-17 | Added startup snippet for EMU modules (tag: v0.3.1) [Alexander Söderqvist]
* b09c764 2016-10-17 | Added master template for statuses, and added support el4104 and el4134 (tag: v0.3.0) [Alexander Söderqvist]
* 9b84c6e 2016-10-14 | Added ek1101 (tag: v0.2.0) [Alexander Söderqvist]
* c917524 2016-10-14 | Updated slope factor for el316x, by default it is only 15 bit resolution (tag: v0.1.1) [Alexander Söderqvist]
* 5a432ea 2016-10-13 | Tested vacuum ioc (tag: v0.1.0) [Alexander Söderqvist]
* 353f74f 2016-10-13 | Test chain with ecat2 [Alexander Söderqvist]
```