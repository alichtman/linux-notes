# Email with neomutt

## Build from Source

https://github.com/neomutt/neomutt

```bash
./configure --build=x86_64-linux-gnu --prefix=/usr --includedir=$(prefix)/include --mandir=$(prefix)/share/man --infodir=$(prefix)/share/info --sysconfdir=/etc --localstatedir=/var --mandir=/usr/share/man --libexecdir=/usr/libexec --with-mailpath=/var/mail --lua --with-ui --gnutls --idn --mixmaster --tokyocabinet --ssl --full-doc --pcre2 --sqlite --gpgme && sudo make install
```

Set it up with this: https://github.com/LukeSmithxyz/mutt-wizard

Set up offline email with `mbsync`.

## Contacts

Use `goobook`. https://gitlab.com/goobook/goobook
