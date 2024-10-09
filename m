From: Samuel Holland <samuel.holland@sifive.com>
Date: Wed, 9 Oct 2024 17:32:53 -0500
Subject: [PATCH] Makefile: perform sanity checks on payload during build
In-Reply-To: <CAKuVd4AiCVqW8OwMTSQwKAkAL=y0CcWwGKNKOPzOBkz+1snJ5Q@mail.gmail.com>
References: <20241004131459.774924-1-tdhutt@gmail.com>
 <6672e8ba-ae62-4892-a160-64f31cb80460@sifive.com>
 <CAKuVd4DNsOsLVp-R9kkTrtAeEjPkA-UwNo40CZOy6JPUrjHspg@mail.gmail.com>
 <CAKuVd4AiCVqW8OwMTSQwKAkAL=y0CcWwGKNKOPzOBkz+1snJ5Q@mail.gmail.com>
Message-ID: <e2ac4d69-2b66-4c8e-aed1-d952f53418d9@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Tim,

On 2024-10-08 5:42 AM, Tim Hutt wrote:
>> I would suggest leaving the recipe for fw_payload.o alone, and using a separate,
>> possibly phony, target for this check. It's surprising to have the recipe for
>> assembling this one file defined in a separate file.
> 
> I think the check then needs to write to a file... something like this?
> 
> $(platform_build_dir)/firmware/fw_payload.o: $(FW_FDT_PATH)
> $(platform_build_dir)/firmware/fw_payload.o: $(FW_PAYLOAD_PATH_FINAL)
> $(platform_build_dir)/firmware/fw_payload.o:
> $(platform_build_dir)/firmware/payload_check.stamp
> $(platform_build_dir)/firmware/payload_check.stamp: $(FW_PAYLOAD_PATH_FINAL)
>     @scripts/check-payload.sh $<
>     @touch $@

Yes, that would work.

>> This can be done portably with od(1):
> 
> Ah cool, I didn't know about `od` (and googling everyone uses `xxi`
> and hacky sed pipelines), thanks!
> 
>> No need for an explicit "exit 0" at the end.
> 
> Actually there is because the exit code will be the value from the
> last command, which is false with the way I've written the script. Try
> this script:
> 
> #!/bin/bash
> false && {
>   echo "Failed"
>   exit 1
> }
> 
> It will not print "Failed" and it will also exit with a failure exit
> code. I have change the script so it's like this:
> 
> true || { ... fail ... }
> 
> But maybe it's worth keeping the explicit exit 0 just because shell is
> crazy like this?

You're right. Sorry for the misinformation. Keeping the `exit 0` is fine, or you
could put the `touch` command inside the script, so the last command is
something that should succeed.

Regards,
Samuel


