ROUTINE Test.Include [Type=INC]
 #define KillArgs kill ^Args(##Expression(""""_%classname_""""),##expression(""""_%methodname_""""))
 #define Args(%arg) ^Args(##Expression(""""_%classname_""""),##expression(""""_%methodname_""""),%arg)
