export PATH=${HOME}/Bin:/usr/local/sbin:/usr/local/bin:${PATH}
export EDITOR=joe

export ORACLE_HOME=${HOME}/Oracle/instantclient_12_1

if [ -d ${ORACLE_HOME} ]
then
    export PATH=${ORACLE_HOME}:${PATH}
    export NLS_LANG="AMERICAN_AMERICA.AL32UTF8"
    export NLS_DATE_FORMAT="DD-Mon-YYYY HH24:MI:SS"
    export NLS_TIMESTAMP_FORMAT="DD-Mon-YYYY HH24:MI:SS.FF"
    export NLS_TIMESTAMP_TZ_FORMAT="DD-Mon-YYYY HH24:MI:SS.FF TZR (TZD)"
    export TNS_ADMIN=${ORACLE_HOME}
fi
    
export PERLBREW_ROOT=${HOME}/Perl
        
if [ -d ${PERLBREW_ROOT} ]
then
    source ${PERLBREW_ROOT}/etc/bashrc
fi

if [ -f ~/.bashrc ]
then
    source ~/.bashrc
fi

if [ -f $(brew --prefix)/etc/bash_completion ]
then
    source $(brew --prefix)/etc/bash_completion
fi
