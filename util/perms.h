/*
 * Copyright (c) 2023 Arm Limited. All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#pragma once

// Permission bits
#define PERM_GLOBAL             __CHERI_CAP_PERMISSION_GLOBAL__
#define PERM_EXECUTE            __CHERI_CAP_PERMISSION_PERMIT_EXECUTE__
#define PERM_LOAD               __CHERI_CAP_PERMISSION_PERMIT_LOAD__
#define PERM_STORE              __CHERI_CAP_PERMISSION_PERMIT_STORE__
#define PERM_LOAD_CAP           __CHERI_CAP_PERMISSION_PERMIT_LOAD_CAPABILITY__
#define PERM_STORE_CAP          __CHERI_CAP_PERMISSION_PERMIT_STORE_CAPABILITY__
#define PERM_STORE_LOCAL_CAP    __CHERI_CAP_PERMISSION_PERMIT_STORE_LOCAL__
#define PERM_SEAL               __CHERI_CAP_PERMISSION_PERMIT_SEAL__
#define PERM_UNSEAL             __CHERI_CAP_PERMISSION_PERMIT_UNSEAL__
#define PERM_SYS_REG            __CHERI_CAP_PERMISSION_ACCESS_SYSTEM_REGISTERS__
#define PERM_EXECUTIVE          __ARM_CAP_PERMISSION_EXECUTIVE__
#define PERM_MUTABLE_LOAD       __ARM_CAP_PERMISSION_MUTABLE_LOAD__
#define PERM_CMPT_ID            __ARM_CAP_PERMISSION_COMPARTMENT_ID__
#define PERM_CAP_INVOKE         __ARM_CAP_PERMISSION_BRANCH_SEALED_PAIR__
#define PERM_USER_0 (1 << 2)
#define PERM_USER_1 (1 << 3)
#define PERM_USER_2 (1 << 4)
#define PERM_USER_3 (1 << 5)
#define PERM_VMEM PERM_USER_0

// Permission groups
#define READ_CAP_PERMS (PERM_LOAD | PERM_LOAD_CAP | PERM_MUTABLE_LOAD)
#define WRITE_CAP_PERMS (PERM_STORE | PERM_STORE_CAP | PERM_STORE_LOCAL_CAP)
#define EXEC_CAP_PERMS (PERM_EXECUTE | PERM_EXECUTIVE | PERM_SYS_REG)
