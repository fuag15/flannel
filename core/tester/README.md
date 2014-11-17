# [Flannel][readme-md] - Tester *( Tester Module )*

Welcome to the plaid tester! This module is used to test all things plaid!

Your specs are expected to return 0 for good and 1 for bad, in the future support will be added for a relevant environment dump function if a test is bad.

Your tests are expected in module/tests and the flannel should use plaid_test to run each test.

---

### plaid_spec *[subdirs]*

- test all modules under each subdir with a /tests folder
- defaults to testing all
- each test print testing <blah>
- [ <tests> ]

---

### plaid_test <function>

- run function as a test, if true print green .
- if false print ' '<function name in red>' ;

---

### wipe_backup_state

- clear backup env vars

---

### store state

- store state vars in var_backup

---

### restore state

- restore state vars from var_backup

---

### wipe_state

- unset state vars

### add_plaid_spec <specname>

- add spec to list to run

### clear_plaid_spec

- clean up spec var

[readme-md]: ../../README.md "Flannel Readme"
