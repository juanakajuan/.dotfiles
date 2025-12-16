## 1. Archive the directory using tar

This command compresses your directory into a single file (a "tarball").

```bash
tar -czf myfiles.tar.gz mydirectory/
```

## 2. Encrypt the archive using gpg (GNU Privacy Guard)

The --symmetric option (or -c) lets you encrypt with a passphrase.
You will be prompted to enter and verify a secure password.

```bash
gpg --symmetric --cipher-algo AES256 myfiles.tar.gz
```

This creates a new encrypted file named myfiles.tar.gz.gpg.
You can then securely delete the original myfiles.tar.gz file.

## 3. Decrypt the archive

To access your files, you first decrypt the GPG file, then extract the tarball.

```bash
gpg -d myfiles.tar.gz.gpg | tar xzvf -
```

You will be prompted for your passphrase to begin the decryption and extraction process.
