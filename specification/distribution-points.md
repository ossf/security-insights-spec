# Distribution Points

The "`distribution-points`" section contains a list of PURLs (Package URLs) for official project releases and distributions, managed directly by the project's maintainers. This section assists Security Insights consumers in verifying the source of installed artifacts. This section is **required**.


```yaml
distribution-points:
  - https://example.com/foo
  - pkg:npm/foobar
```

It is an array containing pURLs to the official releases, official released artifacts, or official packages of the project. Every item must be a string.
