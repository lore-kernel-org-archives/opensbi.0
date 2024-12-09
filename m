From: Richard Hughes <richard@hughsie.com>
Date: Mon, 09 Dec 2024 16:59:29 +0000
Subject: [PATCH 1/1] Add a SBOM template in CycloneDX format
In-Reply-To: <342E5AE9-FA77-4575-AEA3-F26622265121@jrtc27.com>
References: <20241209120653.996455-1-richard@hughsie.com> <20241209120653.996455-2-richard@hughsie.com> <E27C80FB-7AAD-48FB-81F2-AAFC57EB3B32@jrtc27.com> <L2zXq4ayvAmRO2t_N_GnLTebeZ1r8tjTWMwHQt21Bet-vxgLDqa_1S2lXINWxkVlTx5xOT4A-r60scuREbYkCGvUotYesTaA_4AbCkm5bbM=@hughsie.com> <FB9D4FFD-6C1C-4A10-B25E-7CD3214793F7@jrtc27.com> <bAfV35H0RKEHDIb3-uCfWVYzFiPpl1f8MNFX9O-gDXrGIkSPQ1CntcLZfH8pc2wYoLKlHW53KEchekjlswWjqD-R5LAOTjqfiGS4ZQ2lXho=@hughsie.com> <342E5AE9-FA77-4575-AEA3-F26622265121@jrtc27.com>
Message-ID: <7GtZFAmJz91q6u0SHPwrELUXLeMf7EwmPRP3anyUl5z7_5huRFeU1Yil1z7jpNAZxE2OzdsbDdzzLfdbaBIDNoKuHhoAgrAClpSIsjxlVn8=@hughsie.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Monday, 9 December 2024 at 16:37, Jessica Clarke <jrtc27@jrtc27.com> wrote:
> I don?t mean you have to use it that way in consumers. Just that if
> you?re adding the file to upstream projects you should do the work to
> integrate it into their build systems so others can benefit.

Adding it to the upstream build system is pointless without installing or embedding the artifact somewhere. There was a murmuring of a proposal that we could install the dist'd post-processed file in something like /usr/share/sbom but the details are still being worked on and I don't think opensbi would be terribly useful in a docker image or as an rpm anyway.

> IMO the single string field is better than this nonsense format

Okay...

> But better still would be doing the proper thing and having a list of
> author objects, so ideally extend your tooling to support the new
> format rather than pretend it doesn?t exist, and if you can?t do that
> then adopt the old format fully.

We do support multiple authors in the uSWID project, but only the SWID format and CycloneDX format >= 1.6 support it. I've attached a new patch without the authors sections, and uswid --fixup will auto-add the sections as required in the specific format.

Richard
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Add-a-SBOM-template-in-CycloneDX-format.patch
Type: text/x-patch
Size: 1459 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/opensbi/attachments/20241209/13d1f7f4/attachment-0001.bin>
