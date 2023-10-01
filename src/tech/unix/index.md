# 🖥️ unix

My notes on Unix (and Unix-variant) systems.

## WTFs

The Unix world definitely have some WTFs.

### FTPS vs SFTP

- **FTPS:** (FTP with SSL) is the FTP protocol with some SSL to improve security
- **SFTP:** (Secure FTP) is the FTP protocol on top of SSH

IMHO, SFTP is better - SSH is rock-solid, fckn secure (when well configured and used properly with strong algo/config key-pairs), and it has an optimized use of the network (aka.: it should be faster).
