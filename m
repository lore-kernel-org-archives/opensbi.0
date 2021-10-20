From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Wed, 20 Oct 2021 12:20:20 +0100
Subject: [PATCH v6] Makefile: Add build time and compiler info string
In-Reply-To: <87pms06jat.fsf@dell.be.48ers.dk>
References: <20211020094406.1393760-1-anup.patel@wdc.com>
 <87pms06jat.fsf@dell.be.48ers.dk>
Message-ID: <5121DC5F-ADCA-4A7F-9E0D-969BB87B98D6@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 20 Oct 2021, at 12:13, Peter Korsgaard <peter@korsgaard.com> wrote:
> 
>>>>>> "Anup" == Anup Patel <anup.patel@wdc.com> writes:
> 
>> From: Wei Fu <wefu@redhat.com>
>> When we are doing opensbi development, we want to know the build time
>> and compiler info for debug purpose.
> 
>> To enable this message, please add "BUILD_INFO=y", like:
> 
>> ```
>> make BUILD_INFO=y
>> ```
> 
>> NOTE: Using `BUILD_INFO=y` without specifying SOURCE_DATE_EPOCH will
>> violate "reproducible builds". So it's ONLY for development and debug
>> purpose, and should NOT be used in a product which follows "reproducible
>> builds".
> 
>> Signed-off-by: Wei Fu <wefu@redhat.com>
>> Reviewed-by: Anup Patel <anup.patel@wdc.com>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>> Changes since v5:
>> - BUILD_DATE_EPOCH is non-standard name so rename it back to
>>   SOURCE_DATE_EPOCH
>> - Updated README.md and commit description to clearly state when
>>   BUILD_INFO=y violates reprodcible builds
> 
> ..
> 
>> +# Build Info:
>> +# OPENSBI_BUILD_TIME_STAMP -- the compilation time stamp
>> +# OPENSBI_BUILD_COMPILER_VERSION -- the compiler version info
>> +BUILD_INFO ?= n
>> +ifeq ($(BUILD_INFO),y)
>> +OPENSBI_BUILD_DATE_FMT = +%Y-%m-%d %H:%M:%S %z
>> +ifdef SOURCE_DATE_EPOCH
>> +	OPENSBI_BUILD_TIME_STAMP ?= $(shell date -u -d "@$(SOURCE_DATE_EPOCH)" \
>> +		"$(OPENSBI_BUILD_DATE_FMT)" 2>/dev/null || \
>> +		date -u -r "$(SOURCE_DATE_EPOCH)" \
>> +		"$(OPENSBI_BUILD_DATE_FMT)" 2>/dev/null || \
>> +		date -u "$(OPENSBI_BUILD_DATE_FMT)")
> 
> What is this date -r fallback about? According to the spec,
> SOURCE_DATE_EPOCH is always a unix timestamp, never a filename:

GNU date and BSD date have a different but similar interface.

This is the sequence recommended by the Reproducible Builds project[1].

Jess

[1] https://reproducible-builds.org/docs/source-date-epoch/#makefile


