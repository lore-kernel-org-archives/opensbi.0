From: Anup Patel <Anup.Patel@wdc.com>
Date: Wed, 12 May 2021 14:31:55 +0000
Subject: spin_lock_check has different signatures
In-Reply-To: <d8f94296-67d5-dcc6-c6cb-001a4b86563a@danielschaefer.me>
References: <d8f94296-67d5-dcc6-c6cb-001a4b86563a@danielschaefer.me>
Message-ID: <CO6PR04MB7812833E0120164E371C385E8D529@CO6PR04MB7812.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: opensbi <opensbi-bounces@lists.infradead.org> On Behalf Of Daniel
> Schaefer
> Sent: 12 May 2021 16:37
> To: opensbi at lists.infradead.org
> Cc: Chang, Abner (HPS SW/FW Technologist) <abner.chang@hpe.com>
> Subject: spin_lock_check has different signatures
> 
> Hi,
> 
> spin_lock_check has different signatures in the C and in the H file.
> 
> See lib/sbi/riscv_locks.c
> 
> bool spin_lock_check(spinlock_t *lock)
> 
> and include/sbi/riscv_locks.h
> 
> int spin_lock_check(spinlock_t *lock);
> 
> Some related functions also seem to return a value that should be boolean
> but are not.
> Especially spin_lock_unlocked returns an int and is used as return value for
> spin_lock_check.
> 
> So spin_lock_check and spin_lock_unlocked should return bool.
> spin_trylock probably also.

Yes, good catch. This seems to be missed out in the patch reviews.

Please go ahead and send patch to fix this.

Regards,
Anup

