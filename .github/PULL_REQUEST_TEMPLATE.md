# Pull Request

Thank you for contributing to **MultiStudio**!

Please complete the relevant sections of this template before requesting a review.

A clear pull request helps maintainers understand your changes, evaluate potential risks, and review your contribution efficiently.

For contribution requirements, see [CONTRIBUTING.md](../CONTRIBUTING.md).

> [!IMPORTANT]
> Do not disclose unpatched security vulnerabilities, stream keys, access tokens, passwords, or other confidential information in public pull requests. Follow [SECURITY.md](../SECURITY.md) for private vulnerability reporting.

## 1. Summary

### What does this pull request change?

Provide a concise description of the changes.

<!-- Describe what was added, fixed, removed, or improved. -->

### Why is this change needed?

Explain the problem, motivation, or expected benefit.

<!-- Explain the reasoning behind the change, not just the implementation. -->

## 2. Related Issues

<!-- Link related issues or discussions. Use closing keywords only when the PR fully resolves an issue. -->

Closes #

Related to #

## 3. Type of Change

Select all that apply.

- [ ] New feature (`feat`)
- [ ] Bug fix (`fix`)
- [ ] Documentation (`docs`)
- [ ] Refactoring (`refactor`)
- [ ] Performance improvement (`perf`)
- [ ] Tests (`test`)
- [ ] Build system / CMake (`build`)
- [ ] CI/CD (`ci`)
- [ ] Security improvement (`security`)
- [ ] Translation / localization (`i18n`)
- [ ] UI / UX improvement (`ui`)
- [ ] Dependency update (`deps`)
- [ ] Maintenance (`chore`)
- [ ] Breaking change
- [ ] Other

## 4. Affected Components

Select the components affected by this pull request.

- [ ] Application core (C++20)
- [ ] Qt / QML frontend
- [ ] UI components and theme
- [ ] Scenes and sources
- [ ] Preview and rendering
- [ ] Audio processing
- [ ] Video processing
- [ ] FFmpeg integration
- [ ] Streaming / multistreaming
- [ ] Network and authentication
- [ ] Plugin system / SDK
- [ ] Application settings
- [ ] Build system
- [ ] Installer / packaging
- [ ] Tests / benchmarks
- [ ] Translations
- [ ] Documentation
- [ ] GitHub workflows
- [ ] Other

## 5. Implementation Details

Describe the important technical decisions made in this pull request.

Consider including:

- Architectural changes.
- New or modified interfaces.
- Changes to application state.
- New dependencies.
- Error handling.
- Compatibility considerations.
- Alternative approaches considered.

<!-- Focus on important decisions rather than repeating the code diff. -->

### Design Decisions

<!-- Explain non-obvious implementation choices. -->

### Alternatives Considered

<!-- Optional: Describe other approaches and why they were not selected. -->

## 6. Testing and Verification

Describe how the changes were verified.

### Build Verification

- [ ] CMake configuration succeeds.
- [ ] Debug build succeeds.
- [ ] Application launches successfully.
- [ ] Relevant functionality was tested manually.
- [ ] Not applicable.

Recommended Windows commands:

```powershell
cmake --preset windows-mingw-debug
cmake --build build/mingw-debug
```

### Automated Tests

- [ ] Relevant existing tests pass.
- [ ] New tests were added.
- [ ] Regression tests were added for a bug fix.
- [ ] Python pytest tests pass.
- [ ] QML linting passes.
- [ ] Tests are not applicable.
- [ ] Tests could not be completed (explain below).

```powershell
python -m pytest tests/ -v
cmake --build build/mingw-debug --target MultiStudio_qmllint
```

### Code Quality

- [ ] Modified C++ code follows the project's formatting conventions.
- [ ] Relevant clang-format checks were performed.
- [ ] Relevant clang-tidy checks were performed, where available.
- [ ] New compiler warnings were addressed or documented.
- [ ] Unnecessary debugging code was removed.
- [ ] No unrelated files were reformatted.

### Test Results

<!-- Include the actual results. Do not mark checks as passed unless they were performed. -->

| Check | Result | Notes |
|---|---|---|
| CMake configure | Not run | |
| C++ build | Not run | |
| Application launch | Not run | |
| pytest | Not run | |
| QML lint | Not run | |
| clang-format | Not run | |
| clang-tidy | Not run | |
| Manual testing | Not run | |

### Environment

| Property | Value |
|---|---|
| Operating system | |
| Architecture | |
| Qt version | |
| Compiler / toolchain | |
| CMake version | |
| FFmpeg version (if relevant) | |

## 7. Screenshots and Recordings

For user-interface changes, include screenshots or short recordings when helpful.

### Before

<!-- Add an image or write "Not applicable". -->

### After

<!-- Add an image or write "Not applicable". -->

### UI Verification

- [ ] The interface behaves correctly when resized.
- [ ] The change follows the shared MultiStudio theme.
- [ ] Keyboard navigation was considered.
- [ ] Relevant accessibility behavior was checked.
- [ ] User-visible text is translatable with `qsTr()`.
- [ ] Not applicable.

## 8. Performance Impact

Does this change affect performance?

- [ ] No meaningful performance impact expected.
- [ ] Performance improvement.
- [ ] Potential performance regression.
- [ ] Performance impact has not been measured.
- [ ] Not applicable.

### Details

<!-- Describe CPU, GPU, memory, latency, startup time, or other relevant effects. -->

For significant performance changes, include measurements where practical.

| Metric | Before | After | Environment / Notes |
|---|---|---|---|
| CPU usage | | | |
| Memory usage | | | |
| Latency | | | |
| Other | | | |

Do not claim performance improvements without appropriate evidence.

## 9. Security Impact

Does this pull request affect any security-sensitive functionality?

- [ ] No security-sensitive changes.
- [ ] Authentication or streaming credentials.
- [ ] Network communication or TLS.
- [ ] File system access.
- [ ] Media parsing or FFmpeg.
- [ ] Plugin loading or installation.
- [ ] External dependencies.
- [ ] Build or release infrastructure.
- [ ] Other security-sensitive functionality.

### Security Checklist

- [ ] No secrets, tokens, passwords, or stream keys were committed.
- [ ] Untrusted inputs are validated where relevant.
- [ ] Sensitive information is not exposed in logs.
- [ ] File and network permissions were considered.
- [ ] TLS verification has not been improperly disabled.
- [ ] Third-party code and dependencies were reviewed where relevant.
- [ ] Security tests were added where practical.
- [ ] Not applicable.

### Security Notes

<!-- Describe non-sensitive security considerations. Do not publish exploit details for unpatched vulnerabilities. -->

## 10. Plugin and API Compatibility

Complete this section if the change affects plugins, SDKs, or public interfaces.

- [ ] No plugin or public API changes.
- [ ] Backward-compatible API addition.
- [ ] Existing API behavior changed.
- [ ] Breaking API change.
- [ ] Plugin lifecycle affected.
- [ ] Plugin permissions or trust boundaries affected.
- [ ] SDK or developer documentation updated.
- [ ] Not applicable.

### Compatibility Notes

<!-- Describe compatibility impact, version requirements, and migration guidance. -->

Do not assume a plugin API is stable or publicly supported unless that guarantee has been documented.

## 11. Dependencies and Licensing

- [ ] No new dependencies or third-party assets.
- [ ] New dependencies are necessary and documented.
- [ ] Dependency licenses have been reviewed.
- [ ] Required attribution and notices are preserved.
- [ ] Dependencies support the intended toolchains.
- [ ] Dependency security implications were considered.
- [ ] Not applicable.

### New or Updated Dependencies

<!-- List package/library names, versions, reasons, and relevant license information. -->

## 12. Documentation and Localization

- [ ] Documentation has been updated where necessary.
- [ ] New user-visible strings use `qsTr()`.
- [ ] Translation placeholders are preserved.
- [ ] Relevant translation files were updated where practical.
- [ ] New functionality is documented accurately.
- [ ] Breaking changes include migration guidance.
- [ ] Not applicable.

### Documentation Changes

<!-- List updated documentation or explain why no updates are needed. -->

## 13. Compatibility and Breaking Changes

Does this pull request change existing behavior?

- [ ] No breaking changes.
- [ ] User-visible behavior changed.
- [ ] Configuration format changed.
- [ ] Existing files or settings require migration.
- [ ] Public interface changed.
- [ ] Build requirements changed.
- [ ] Other compatibility impact.

### Migration Instructions

<!-- Required when users or contributors must take action after this change. -->

## 14. Risks and Limitations

Describe any known limitations, unresolved concerns, or possible regressions.

### Known Limitations

<!-- Write "None known" if applicable. -->

### Potential Risks

<!-- Explain risks and any mitigations. -->

### Follow-Up Work

<!-- Link related follow-up issues or describe work intentionally left out of scope. -->

## 15. Reviewer Notes

Is there anything reviewers should pay particular attention to?

<!-- Highlight complex logic, tradeoffs, areas requiring additional review, or questions for maintainers. -->

## 16. Final Checklist

Before requesting review, confirm the following.

### General

- [ ] My pull request has a clear and focused purpose.
- [ ] I have reviewed my own changes.
- [ ] I have checked for duplicate or conflicting work.
- [ ] I have followed [CONTRIBUTING.md](../CONTRIBUTING.md).
- [ ] I have followed [CODE_OF_CONDUCT.md](../CODE_OF_CONDUCT.md).
- [ ] My changes align with the goals of MultiStudio.

### Quality

- [ ] I have tested the affected functionality.
- [ ] I have included appropriate tests or explained why they are unnecessary.
- [ ] I have not introduced unnecessary complexity.
- [ ] I have addressed relevant warnings.
- [ ] I have documented important technical decisions.

### Security and Licensing

- [ ] I have not included sensitive credentials or personal information.
- [ ] I have considered the security implications of my changes.
- [ ] I have respected applicable licenses and attribution requirements.
- [ ] I have not knowingly included unauthorized third-party material.

### Submission

- [ ] The pull request title clearly describes the change.
- [ ] The pull request description is complete.
- [ ] Related issues are linked where applicable.
- [ ] Screenshots or recordings are included for relevant UI changes.
- [ ] Known limitations are documented.
- [ ] I am ready to respond to review feedback.

---

## Maintainer Review

<!-- Optional section for maintainers. Contributors do not need to complete it. -->

- [ ] Scope and architecture reviewed.
- [ ] Implementation reviewed.
- [ ] Security considerations reviewed.
- [ ] Tests and CI results reviewed.
- [ ] Documentation and licensing reviewed.
- [ ] Compatibility impact reviewed.
- [ ] Ready to merge.

---

**Thank you for contributing to MultiStudio!**

Every thoughtful contribution helps build a more reliable, secure, and extensible open-source streaming studio.