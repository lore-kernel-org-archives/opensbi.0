From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Mon, 9 Dec 2024 16:37:41 +0000
Subject: [PATCH 1/1] Add a SBOM template in CycloneDX format
In-Reply-To: <bAfV35H0RKEHDIb3-uCfWVYzFiPpl1f8MNFX9O-gDXrGIkSPQ1CntcLZfH8pc2wYoLKlHW53KEchekjlswWjqD-R5LAOTjqfiGS4ZQ2lXho=@hughsie.com>
References: <20241209120653.996455-1-richard@hughsie.com>
 <20241209120653.996455-2-richard@hughsie.com>
 <E27C80FB-7AAD-48FB-81F2-AAFC57EB3B32@jrtc27.com>
 <L2zXq4ayvAmRO2t_N_GnLTebeZ1r8tjTWMwHQt21Bet-vxgLDqa_1S2lXINWxkVlTx5xOT4A-r60scuREbYkCGvUotYesTaA_4AbCkm5bbM=@hughsie.com>
 <FB9D4FFD-6C1C-4A10-B25E-7CD3214793F7@jrtc27.com>
 <bAfV35H0RKEHDIb3-uCfWVYzFiPpl1f8MNFX9O-gDXrGIkSPQ1CntcLZfH8pc2wYoLKlHW53KEchekjlswWjqD-R5LAOTjqfiGS4ZQ2lXho=@hughsie.com>
Message-ID: <342E5AE9-FA77-4575-AEA3-F26622265121@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 9 Dec 2024, at 16:27, Richard Hughes <richard@hughsie.com> wrote:
> On Monday, 9 December 2024 at 16:12, Jessica Clarke <jrtc27@jrtc27.com> wrote:
>>> then we use a tool called uswid to "find" all the SBOM components and populate the tokenized values automatically
>> Should that not be part of the upstream build process for each project?
> 
> For coreboot, we could do that -- i.e. we'd build libpng, libhwbase (and any other deps) *then* coreboot -- and so it's perfectly fine to do this in the upstream build system. There's an example using meson in fwupd: https://github.com/fwupd/fwupd/blob/main/contrib/meson.build#L15 -- although I'd advise not doing this at this point.
> 
> For EDK II the upstream submodule build system typically isn't used at all, and so we can't rely on the subproject cmake/scons/whatever generating the post-processed file which we can absorb as part of the firmware build. Shipping the template seems a pragmatic first step, and means the open source software appears accurately on the SBOM HTML page of the OEM "binary" firmware.

I don?t mean you *have* to use it that way in consumers. Just that if
you?re adding the file to upstream projects you should do the work to
integrate it into their build systems so others can benefit. You
wouldn?t add a C source file that wasn?t built by the Makefile even if
your project wasn?t using the upstream Makefiles, so don?t do the same
for other resources.

>>> "authors": [
>>> {
>>> "name": "Anup Patel, Atish Patra, Bin Meng, Samuel Holland, Xiang W, Damien Le Moal, Heinrich Schuchardt, Yu Chien Peter Lin, Himanshu Chauhan, Inochi Amaoto, Alistair Francis, Andrew Jones, Cl?ment L?ger, Mayuresh Chitale, Nikita Shubin, Vivian Wang, Rahul Pathak, Ivan Orlov, Lad Prabhakar, Jessica Clarke, Xiang Wang, Abner Chang, Ben Zong-You Xie, Guo Ren, Liu Yibin, Nylon Chen, Bo Gan, Dong Du, Olof Johansson, Daniel Schaefer, Jan Remes, Nam Cao, Nick Kossifidis"
>>> }
>>> ]
>> Should this not be:
>> "authors:" [
>> { "name": "Anup Patel" },
>> { "name": "Atish Patra" },
>> ...
>> ]
> 
> It certainly *could* be. We didn't do it like this as CycloneDX < v1.6 had just a single string field for the author (and SPDX is just the same), and we wanted to maintain compatibility between the different formats. If this is a blocker for inclusion let me know and I'll write some code in uswid to accept either style.

IMO the single string field is better than this nonsense format that
claims to be a list of authors but is a list of a single author (what
happens when you have SBOMs that really do have lists of authors and
you now interpret this as being an author called ?Anup ? Kossifidis??).
But better still would be doing the proper thing and having a list of
author objects, so ideally extend your tooling to support the new
format rather than pretend it doesn?t exist, and if you can?t do that
then adopt the old format fully.

Jess


