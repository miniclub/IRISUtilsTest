ROUTINE Test.Include [Type=INC]
 #define KillArgs kill ^Args(##Expression(%classname),##expression(%methodname))
 #define Args(%arg) ^Args(##Expression(%classname),##expression(%methodname),%arg)
