/*

  Makeshift replacement for getpwuid()
  that is not working in mk on systems
  with LDAP

  (C) 2024 Carlo de Falco
  Distributed under the terms of the WTFPL <http://www.wtfpl.net/>
  
 */


#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <pwd.h>

struct passwd *getpwuid(uid_t uid) {

  struct passwd *retval = NULL;
  if (uid == getuid()) {
    retval = malloc(sizeof(struct passwd));
    retval->pw_name = getenv("USER");
    retval->pw_passwd = "";
    retval->pw_uid = getuid();
    retval->pw_gid = getgid();
    retval->pw_gecos = "";
    retval->pw_dir = getenv("HOME");
    retval->pw_shell = getenv("SHELL");
  } 
  
  return retval;
}

  
