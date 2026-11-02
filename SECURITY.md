# Security Policy

Security is an important part of MultiStudio.

MultiStudio is an open-source desktop application for live streaming and multistreaming, developed using C++20, Qt 6, QML, and optional FFmpeg integration.

Because streaming software may process sensitive credentials, external media, network traffic, and third-party integrations, we encourage responsible vulnerability reporting and security-conscious development.

We appreciate everyone who helps protect MultiStudio and its users.

## 1. Supported Versions

MultiStudio is currently in early development. Security support is provided on a best-effort basis.

| Version | Security Support |
|---|---|
| 0.1.x (Development) | Best-effort |
| Older development versions | Not supported |
| Unofficial or modified builds | Not guaranteed |

Development builds may contain experimental or incomplete functionality.

Security support, release policies, and maintenance commitments may change as the project evolves.

Users are encouraged to use the latest official release or an appropriate maintained development version.

## 2. Reporting a Vulnerability

**Do not report security vulnerabilities through public GitHub issues, discussions, pull requests, or other public channels.**

Public disclosure before a vulnerability has been assessed may expose users to unnecessary risk.

If you discover a potential security vulnerability, please report it privately.

### Preferred Reporting Method

Use GitHub's private vulnerability reporting feature, if enabled for the repository.

1. Open the official MultiStudio GitHub repository.
2. Navigate to the **Security** tab.
3. Select **Report a vulnerability**.
4. Complete the private report with relevant technical details.
5. Submit the report for maintainer review.

If private vulnerability reporting is unavailable, use a private security contact method explicitly published by the project maintainers.

If no private reporting channel is available, please avoid posting exploit details publicly while seeking an appropriate contact method.

Do not send credentials, private keys, or confidential user information through insecure communication channels.

## 3. Information to Include

A useful vulnerability report should include:

- **Summary:** A concise description of the suspected vulnerability.
- **Affected version:** The MultiStudio version, build, or commit.
- **Affected component:** The relevant application component or dependency.
- **Environment:** Operating system, architecture, and relevant dependency versions.
- **Reproduction:** Clear, minimal steps to reproduce the issue in an authorized test environment.
- **Expected behavior:** What the application should do.
- **Actual behavior:** What happens instead.
- **Security impact:** The potential effect on confidentiality, integrity, or availability.
- **Evidence:** Relevant sanitized logs, screenshots, or a minimal proof of concept.
- **Mitigation:** Any suggested workaround or potential fix.

If the vulnerability involves a third-party library, include its name and version when known.

### Protect Sensitive Information

Never include real:

- Stream keys.
- OAuth access or refresh tokens.
- Account passwords.
- API credentials.
- Private cryptographic keys.
- Session cookies.
- Personal or confidential data.

Use dummy credentials and test accounts wherever possible.

## 4. Security Response Process

Maintainers aim to follow a structured process when reviewing security reports.

### Step 1 — Initial Review

The report is reviewed to determine whether sufficient information is available for investigation.

Additional details may be requested.

### Step 2 — Validation

Maintainers assess whether the reported behavior is reproducible and represents a security vulnerability.

### Step 3 — Impact Assessment

The issue is evaluated according to its potential impact, exploitability, affected components, and available mitigations.

### Step 4 — Remediation

When appropriate, maintainers develop a fix, update a dependency, or document a mitigation.

### Step 5 — Verification

The proposed remediation is tested to confirm that it addresses the reported issue without introducing unacceptable regressions.

### Step 6 — Release and Disclosure

Security fixes may be included in a release or source-code update.

A security advisory may be published when appropriate.

Maintainers may coordinate disclosure with the reporter and affected third-party projects.

### Response Times

MultiStudio is maintained on a best-effort basis.

**No specific acknowledgment, investigation, remediation, or release deadline is guaranteed.**

The time required to resolve a vulnerability depends on its severity, complexity, available resources, and dependencies.

## 5. Vulnerability Severity

Security issues may be assessed using the following general categories.

| Severity | General Description |
|---|---|
| Critical | Potentially severe compromise with broad impact |
| High | Significant compromise of credentials, application integrity, or user data |
| Medium | Security weakness with meaningful but limited impact |
| Low | Limited security impact or substantial exploitation constraints |
| Informational | Security-related observation without a demonstrated vulnerability |

These categories are guidance rather than a formal severity commitment.

Maintainers may consider CVSS or other established assessment methods when appropriate.

Final severity depends on the actual technical circumstances.

## 6. Security Scope

Potential security vulnerabilities include, but are not limited to, the following areas.

### 6.1 Streaming Credentials and Authentication

MultiStudio may interact with streaming platforms and authentication services.

Relevant issues include:

- Exposure of stream keys or authentication tokens.
- Insecure storage of credentials.
- Accidental disclosure through logs or error messages.
- Unauthorized access to connected accounts.
- Improper handling of authentication sessions.
- Failure to revoke or invalidate credentials when appropriate.
- Exposure of sensitive configuration values.

Credentials should be treated as sensitive throughout their lifecycle.

### 6.2 Network Communication

Streaming and service integrations may require communication with external systems.

Relevant issues include:

- Improper TLS certificate validation.
- Insecure transmission of sensitive information.
- Unauthorized network requests.
- Incorrect validation of remote endpoints.
- Unsafe handling of server responses.
- Protocol implementation weaknesses.
- Security issues involving RTMP, RTMPS, or other supported protocols.

Encrypted connections should be preferred where supported.

### 6.3 Media Processing

MultiStudio may process audio, video, images, and other media from external sources.

Relevant issues include:

- Unsafe parsing of malformed media.
- Memory corruption.
- Out-of-bounds memory access.
- Integer overflow affecting memory safety.
- Use-after-free vulnerabilities.
- Unsafe handling of untrusted media streams.
- Resource exhaustion caused by malformed input.
- Vulnerabilities in FFmpeg or other media-processing libraries.

Untrusted media must be handled carefully, particularly when native libraries are involved.

### 6.4 Application and File System Security

Relevant issues include:

- Arbitrary code execution.
- Privilege escalation.
- Unauthorized file access.
- Path traversal.
- Unsafe file operations.
- Insecure configuration storage.
- Unsafe temporary-file handling.
- Insecure loading of external resources.
- Improper validation of user-controlled paths.

MultiStudio should operate with the minimum permissions necessary for its functionality.

### 6.5 Qt, QML, and C++ Security

Relevant issues include:

- Unsafe object lifetime management.
- Memory safety vulnerabilities.
- Incorrect handling of QObject ownership.
- Unsafe interaction between QML and C++.
- Exposure of privileged backend functionality to untrusted inputs.
- Unvalidated URLs or file paths.
- Unsafe use of dynamic components.
- Unexpected execution of external commands.

Contributors should use modern C++ practices, Qt ownership conventions, and explicit input validation.

### 6.6 Plugin System Security

MultiStudio plans to support third-party plugins, including plugins distributed through Git repositories.

**Third-party plugins must not automatically be considered trustworthy.**

Potential security issues include:

- Unauthorized access to application data.
- Exposure of streaming credentials.
- Malicious or compromised plugin packages.
- Unsafe plugin installation or updates.
- Dependency substitution or supply-chain attacks.
- Improper validation of plugin metadata.
- Unexpected execution of plugin-provided code.
- Excessive permissions granted to plugins.
- Insecure communication between plugins and the application.

Plugin installation, verification, isolation, and permission controls should be considered during system design.

Unless explicitly implemented and documented, users should not assume that plugins run in a security sandbox.

Only install plugins from sources you trust.

### 6.7 Third-Party Dependencies

Potentially affected dependencies include:

- Qt.
- FFmpeg.
- CMake build dependencies.
- Python development and testing packages.
- Other third-party libraries and tools.

Relevant issues include:

- Known vulnerabilities in dependencies.
- Compromised packages.
- Dependency confusion.
- Malicious package updates.
- Unsafe build scripts.
- Unverified downloaded components.

Some vulnerabilities may require upstream fixes before MultiStudio can fully address them.

### 6.8 Build and Release Security

The integrity of distributed application builds is important.

Relevant issues include:

- Compromised CI/CD workflows.
- Unauthorized release modifications.
- Exposure of repository or release credentials.
- Unsafe handling of GitHub Actions secrets.
- Untrusted build dependencies.
- Malicious artifacts.
- Incorrect release permissions.
- Insecure update mechanisms.

Build and release workflows should use appropriately restricted permissions and trusted dependencies.

Official release artifacts should be distributed through clearly identified project channels.

## 7. Security Best Practices for Users

We recommend that MultiStudio users:

- Download releases only from official project distribution channels.
- Keep MultiStudio updated.
- Keep their operating system and security updates current.
- Never share stream keys, passwords, or authentication tokens.
- Prefer encrypted streaming connections where supported.
- Avoid opening suspicious or untrusted media.
- Install third-party plugins only from trusted sources.
- Review the permissions requested by external integrations.
- Protect local configuration and credential files.
- Use test credentials when evaluating experimental features.
- Revoke and replace credentials if exposure is suspected.

Users should understand that development builds may not provide the same stability or security assurances as mature releases.

## 8. Security Best Practices for Contributors

Contributors are expected to follow secure development practices.

### Credential Handling

- Never commit secrets or credentials.
- Never print sensitive values in logs.
- Use placeholders in documentation and tests.
- Avoid embedding credentials in source code.
- Minimize the lifetime and exposure of sensitive values.

### Input Validation

- Treat external inputs as untrusted.
- Validate file paths, URLs, configuration values, and network responses.
- Check input sizes and boundaries.
- Handle malformed data safely.
- Avoid unsafe assumptions about external services.

### Memory and Resource Safety

- Prefer RAII and automatic resource management.
- Follow Qt object ownership rules.
- Avoid unnecessary raw owning pointers.
- Check buffer boundaries.
- Handle resource allocation failures appropriately.
- Avoid blocking the UI thread with unbounded operations.

### Network Security

- Do not disable TLS certificate verification to bypass errors.
- Avoid sending credentials over insecure channels.
- Validate remote endpoints where appropriate.
- Handle authentication failures safely.
- Do not expose secrets in diagnostic output.

### Dependency Management

- Prefer maintained dependencies.
- Review new dependencies before introducing them.
- Monitor relevant security advisories.
- Avoid unnecessary dependency additions.
- Verify the origin of downloaded tools and packages.

### Testing

Security fixes should include relevant regression tests whenever practical.

Tests must not require real user credentials or access to unauthorized systems.

## 9. Responsible Disclosure Guidelines

We ask security researchers to follow responsible disclosure practices.

Researchers should:

- Test only systems they own or are explicitly authorized to assess.
- Avoid accessing or modifying other users' data.
- Avoid disrupting streaming platforms or third-party services.
- Use isolated test environments and test accounts.
- Minimize collection of sensitive information.
- Stop testing if unintended access to private information occurs.
- Report findings privately.
- Coordinate public disclosure with maintainers when possible.

A security report does not grant authorization to test systems operated by other organizations.

MultiStudio cannot grant permission to assess third-party streaming services or infrastructure.

## 10. Out-of-Scope Reports

The following generally do not qualify as MultiStudio security vulnerabilities without a demonstrated security impact:

- Ordinary application crashes without a security consequence.
- Cosmetic or visual defects.
- General feature requests.
- Performance issues without a security impact.
- Problems caused solely by unsupported environments.
- Issues affecting unofficial builds that cannot be reproduced in supported code.
- Vulnerabilities exclusively affecting unrelated third-party services.

An application crash may still be security-relevant if it results from a memory safety issue, can be triggered by untrusted input, or creates a meaningful denial-of-service risk.

Maintainers may reconsider scope when additional evidence is provided.

## 11. Security Updates and Advisories

Security fixes may be delivered through:

- Official application releases.
- Source-code updates.
- Dependency updates.
- Documented mitigations.
- GitHub Security Advisories, when appropriate.

Users should monitor the official MultiStudio repository for release notes and security announcements.

Not every security fix will require a separate advisory.

## 12. Third-Party Security Issues

Some vulnerabilities may originate in external libraries or services.

When a report affects an upstream dependency, maintainers may:

1. Confirm whether MultiStudio is affected.
2. Identify available mitigations.
3. Update to a patched dependency version.
4. Coordinate with upstream maintainers when appropriate.
5. Document any remaining limitations.

Security reports should distinguish between a vulnerability in MultiStudio's own code and one originating in an external component whenever possible.

## 13. Security Research and Recognition

We appreciate researchers who disclose vulnerabilities responsibly.

Maintainers may acknowledge contributors in release notes or security advisories with their permission.

Anonymous reporting and acknowledgment preferences will be respected where practical.

MultiStudio does not currently promise financial rewards, a bug bounty, or a formal vulnerability disclosure safe harbor.

Any future recognition or bounty program must be announced explicitly through official project channels.

## 14. Contact

For security-related concerns, use GitHub's private vulnerability reporting feature when available.

If the repository publishes another private security contact method, that method may also be used.

Please do not publish sensitive vulnerability details in public issues, discussions, pull requests, or social media.

---
**MultiStudio — Open-Source Multistreaming Studio**

Thank you for helping make MultiStudio safer for everyone.
