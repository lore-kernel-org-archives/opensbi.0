From: Andreas Schwab <schwab@linux-m68k.org>
Date: Wed, 19 Jul 2023 18:17:59 +0200
Subject: Boot failure after QEMU's upgrade to OpenSBI v1.3 (was Re:
 [PATCH for-8.2 6/7] target/riscv: add 'max' CPU type)
In-Reply-To: <CAEUhbmVoYnOMEi_Hqi7iX0__jTjbEnaxrHjCJHuMVaUAcMiACA@mail.gmail.com>
	(Bin Meng's message of "Wed, 19 Jul 2023 23:45:40 +0800")
References: <20230712-stench-happiness-40c2ea831257@spud>
	<3e9b5be8-d3ca-3a17-bef9-4a6a5bdc0ad0@ventanamicro.com>
	<20230712-tulip-replica-0322e71c3e81@spud>
	<744cbde6-7ce5-c327-3c5a-3858e994cc39@ventanamicro.com>
	<20230712-superhero-rabid-578605f52927@spud>
	<5dd3366d-13ba-c7fb-554f-549d97e7d4f9@ventanamicro.com>
	<20230712-fancied-aviator-270f51166407@spud>
	<20230713-craziness-lankiness-8aec3db24993@spud>
	<CAAhSdy3J5HUoVP21jo11FBuAFSPSxHNKtuL7amn-5t7n_smoSg@mail.gmail.com>
	<20230714-reoccur-confined-4b37494b1201@spud>
	<20230714-hash-handwrite-339817b93ba1@spud>
	<CAOnJCUL3=G_yV5cP5OjCGQKNvciNgXWnoQGUU4Bqh4iwnx6C4A@mail.gmail.com>
	<CAKmqyKO3O87ETntm7pzMPedKW19ANpEp5nM4jFiHXO76K9saTQ@mail.gmail.com>
	<CAAhSdy1+wRpqoTFmBRNF7uFnc_fFCyCnt5ctoMu7zhTiu2GcTg@mail.gmail.com>
	<CAKmqyKOTik3tUa1MyHAyc5jOWcPDY=seHuR-VurHbSKaCKQFpw@mail.gmail.com>
	<CAAhSdy1vkk6xj7HSyPHKN0d0qgYrq_rn-+iw_rxkdDBKqpC2yw@mail.gmail.com>
	<CAEUhbmVoYnOMEi_Hqi7iX0__jTjbEnaxrHjCJHuMVaUAcMiACA@mail.gmail.com>
Message-ID: <87zg3rvps8.fsf@igel.home>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Jul 19 2023, Bin Meng wrote:

>> Please check
>> https://github.com/riscv-software-src/opensbi/releases/tag/v1.3.1
>>
>> I hope this helps.
>
> Hi Alistair,
>
> Do we need to update QEMU's opensbi binaries to v1.3.1?
>
> Hi Anup,
>
> Somehow I cannot see the 'tag' v1.3.1 being populated in the opensbi
> git repo. Am I missing anything?

You need to run git fetch --tags, because the tag is not part of any
branch, thus not fetched automatically.

-- 
Andreas Schwab, schwab at linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

