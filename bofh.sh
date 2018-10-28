#!/bin/bash

## Copyright (C) 2015 Stoycho Ganev

## BOFH excuses generator
## Enter give the count as a parameter or give no parameter for a count of 1.

# Array initialization begin

FIRST=(Temporary Intermittant Partial Critical Unspecified Redundant Total Multiplexed Inherent Duplicated Dual-Homed Synchronous Bidirectional Serial Asynchronous \
Multiple Replicated Non-Replicated Unregistered Non-Specific Generic Malformed Localised Resignalled Dereferenced Nullified Aborted Serious Minor Major Extraneous Illegal \
Insufficient Viral Unsupported Outmoded Legacy Permanent Invalid Deprecated Virtual Unreportable Undetermined Undiagnosable Unfiltered Static Dynamic Delayed Immediate \
Nonfatal Fatal Non-Valid Unvalidated Non-Static Unreplicatable Non-Serious)

SECOND=(array backtrace systems kernel hardware software firmware backplane logic-subsystem integrity subsystem memory comms integrity checksum protocol parity bus timing \
synchronisation topology transmission reception stack framing code programming peripheral environmental bootstrap operation parameter syntax initialisation execution resource \
encryption decryption file precondition authentication paging swapfile service gateway request proxy media registry configuration metadata streaming retrieval installation library handler)

THIRD=(interruption destabilisation destruction desynchronisation failure emergency dereferencing overflow underflow nmi interrupt corruption anomaly seizure override \
reclock rejection invalidation halt exhaustion infection incompatibility timeout expiry unavailability bug condition crash dump crashdump stackdump problem lockout)

FOURTH=(error problem warning signal flag alert exception issue)

# Array initialization end

if [[ $# -eq 0 ]]
then # no argument given
        echo "${FIRST[$(( RANDOM % (55 - 0 + 1 ) + 0 ))]}" "${SECOND[$(( RANDOM % (55 - 0 + 1 ) + 0 ))]}" "${THIRD[$(( RANDOM % (32 - 0 + 1 ) + 0 ))]}" "${FOURTH[$(( RANDOM % (6 - 0 + 1 ) + 0 ))]}".
else # argument given
        count=$1
        while [ "$count" -gt 0 ]; do
                echo "${FIRST[$(( RANDOM % (55 - 0 + 1 ) + 0 ))]}" "${SECOND[$(( RANDOM % (55 - 0 + 1 ) + 0 ))]}" "${THIRD[$(( RANDOM % (32 - 0 + 1 ) + 0 ))]}" "${FOURTH[$(( RANDOM % (6 - 0 + 1 ) + 0 ))]}".
                let count=count-1
#               if [ $count -ne 0 ]
#               then
#                       echo
#               fi
        done
fi
