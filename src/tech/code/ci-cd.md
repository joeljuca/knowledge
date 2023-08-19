# ci/cd ⚙️

Tips & tricks out of wisdom acquired from working on CI/CD.

## gitlab 🦊

### Use file(s) hash(es) as cache keys

After spending a huge amount of time on it, I figured [it's actually embedded into GitLab CI itself](https://gitlab.com/help/ci/yaml/README.md#cachekeyfiles). In order to use file hashes, add them to `cache:key:files`:

```yml
# .gitlab-ci.yml

# Eg.: a global cache setup
cache:
  key:
    files:
      - yarn.lock
```

Proper documentation available at https://gitlab.com/help/ci/yaml/README.md#cachekeyfiles
