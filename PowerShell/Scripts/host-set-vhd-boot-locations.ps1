# Windows2008R2 VHD (Developer)
# Guid = {b85829b2-fe90-11de-b31b-be9a647009c0}

# To add an additional VHD to the boot menu...
# bcdedit /copy {identifier} /d "description"
# To remove an additional VHD to the boot menu...
# bcdedit /delete {identifier}
# To set the description property of a boot entry...
# bcdedit /set {identifier} descrption "Some Description"

bcdedit /set {b85829b2-fe90-11de-b31b-be9a647009c0} osdevice vhd="[v:]\native\developer\2008r2_developer.vhd"
bcdedit /set {b85829b2-fe90-11de-b31b-be9a647009c0} device vhd="[v:]\native\developer\2008r2_developer.vhd"
