# Open Source Cities Generic Theme

Generic Theme which will be shared among different city repos.

This theme uses LESS for managing style. If you need to change any of the rules in `static-src/less/*.less` files you need to build the final
minified css version and check them in the repo as well, because UI depends on (`static/css/style.min.css`). To build:

```bash
make build
```

Also not that if you change CSS or JS files you need to increment the corresponding version in `data/version.json` to prevent unwanted client
side caching on viewer's browsers.
