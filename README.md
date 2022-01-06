
## Bump build number

```bash
agvtool bump
git add -u
git commit -m "Bump build number to $(agvtool vers -terse)"
```
