* Create p0 patch
```
git diff --no-prefix > ../patch/PSI/psi_etherlab_master.p0.patch
```

* patch the p0 patch
```
patch -d . --ignore-whitespace -p0 < ../patch/PSI/psi_etherlab_master.p0.patch
```
