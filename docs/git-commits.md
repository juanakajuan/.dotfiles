Commit Message Template
```text
<type>(<scope>): <short subject>
<BLANK>
<body>
<BLANK>
<footer>
```

Where:
- **type** – the kind of change you’re making:
  - feat     → a new feature
  - fix      → a bug fix
  - docs     → documentation only changes
  - style    → formatting, missing semi-colons, etc (no code change)
  - refactor → code change that neither fixes a bug nor adds a feature
  - perf     → code change that improves performance
  - test     → adding missing tests or correcting existing tests
  - chore    → updating build tasks, package manager configs, etc
- **scope** – a noun describing a section of the codebase (e.g. `api`, `auth`, `ui`)
- **short subject** – imperative, ≤ 50 characters, no trailing period
- **body** – (optional) more detailed explanatory text, wrapped at ~72 chars
- **footer** – (optional) metadata, e.g.  
    - `BREAKING CHANGE: <description>`  
    - `Closes #123`, `Reverts #456`

Tips:
- Use present tense (“fix”, not “fixed”)
- Reference issues in the footer, not the body
- Separate subject from body with a blank line

Examples

```text
feat(auth): add JWT refresh-token endpoint

Clients can now request a new JWT via POST /auth/refresh  
– Body: { "refreshToken": "<token>" }  
Returns 200 with { accessToken, refreshToken }  

Closes #78
```

```text
fix(api): correct header parsing for CORS preflight

When the browser sent OPTIONS request, our code misread
the Access-Control-Allow-Headers value. Now we trim
and split on commas properly.

Fixes #102
```

```text
docs: update README with setup instructions

- Added Node.js version requirement
- Documented `npm run lint` step
- Clarified environment-variable names
```

```text
refactor(ui): extract Button component from Login form

- Created reusable Button in /components/Button.jsx
- Updated LoginForm.jsx and SignupForm.jsx to use it
- No behavior changes
```

```text
perf(db): batch insert users to reduce round-trips

Switch from single-row INSERT to multi-row INSERT when
creating seed data in development. This speeds up local
rebuilds by ~3×.
```

```text
chore(ci): add GitHub Action for ESLint

- Runs `npm run lint` on push and PR
- Caches node_modules for faster runs
```
