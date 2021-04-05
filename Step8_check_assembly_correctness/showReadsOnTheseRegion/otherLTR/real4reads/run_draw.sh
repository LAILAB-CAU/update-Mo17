#!/bin/bash

# perl drawTriangularCorr.pl 2ed31109-15b8-4adb-ae8f-9538c6479764:0-314051	2ed31109-15b8-4adb-ae8f-9538c6479764:0-314051	2ed31109.corr
# perl drawTriangularCorr.pl 41bca623-0639-4aa5-a342-d010620f1417:0-304356	2ed31109-15b8-4adb-ae8f-9538c6479764:0-314051	41bca623_2ed31109.corr
# perl drawTriangularCorr.pl 41bca623-0639-4aa5-a342-d010620f1417:0-304356	491c3912-26e5-455e-b361-115d24ddc053:0-297508	41bca623_491c3912.corr
# perl drawTriangularCorr.pl 41bca623-0639-4aa5-a342-d010620f1417:0-304356	41bca623-0639-4aa5-a342-d010620f1417:0-304356	41bca623.corr
# perl drawTriangularCorr.pl 491c3912-26e5-455e-b361-115d24ddc053:0-297508	491c3912-26e5-455e-b361-115d24ddc053:0-297508		491c3912.corr
# perl drawTriangularCorr.pl ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:0-280455	2ed31109-15b8-4adb-ae8f-9538c6479764:0-314051	ccedfaa7_2ed31109.corr
# #perl drawTriangularCorr.pl ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:0-280455 491c3912-26e5-455e-b361-115d24ddc053:0-297508	ccedfaa7_491c3912.corr
# perl drawTriangularCorr.pl ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:0-280455	ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:0-280455		ccedfaa7.corr
# perl drawTriangularCorr.pl ptg000148l:16500000-16520000	ptg000148l:16500000-16520000	200bp.corr	
# perl drawTriangularCorr.pl ptg000148l:16500000-16520000	ptg000148l:16500000-16520000	500bp.corr	
# perl drawTriangularCorr.pl ptg000148l:16500000-16520000	ptg000148l:16500000-16520000	1k.corr	
# perl drawTriangularCorr.pl ptg000148l:16500000-16520000	ptg000148l:16500000-16520000	2k.corr	


# perl drawTriangularCorr.pl 2ed31109-15b8-4adb-ae8f-9538c6479764:100000-120000	2ed31109-15b8-4adb-ae8f-9538c6479764:100000-120000	2ed31109_1k.corr &
# perl drawTriangularCorr.pl 2ed31109-15b8-4adb-ae8f-9538c6479764:100000-120000	2ed31109-15b8-4adb-ae8f-9538c6479764:100000-120000	2ed31109_200bp.corr &
# perl drawTriangularCorr.pl 2ed31109-15b8-4adb-ae8f-9538c6479764:100000-120000	2ed31109-15b8-4adb-ae8f-9538c6479764:100000-120000	2ed31109_2k.corr &
# perl drawTriangularCorr.pl 2ed31109-15b8-4adb-ae8f-9538c6479764:100000-120000	2ed31109-15b8-4adb-ae8f-9538c6479764:100000-120000	2ed31109_500bp.corr &
# perl drawTriangularCorr.pl 41bca623-0639-4aa5-a342-d010620f1417:100000-120000	41bca623-0639-4aa5-a342-d010620f1417:100000-120000	41bca623_1k.corr &
# perl drawTriangularCorr.pl 41bca623-0639-4aa5-a342-d010620f1417:100000-120000	41bca623-0639-4aa5-a342-d010620f1417:100000-120000	41bca623_200bp.corr &
# perl drawTriangularCorr.pl 41bca623-0639-4aa5-a342-d010620f1417:100000-120000	41bca623-0639-4aa5-a342-d010620f1417:100000-120000	41bca623_2k.corr &
# perl drawTriangularCorr.pl 41bca623-0639-4aa5-a342-d010620f1417:100000-120000	41bca623-0639-4aa5-a342-d010620f1417:100000-120000	41bca623_500bp.corr &
# perl drawTriangularCorr.pl 491c3912-26e5-455e-b361-115d24ddc053:100000-120000	491c3912-26e5-455e-b361-115d24ddc053:100000-120000	491c3912_1k.corr &
# perl drawTriangularCorr.pl 491c3912-26e5-455e-b361-115d24ddc053:100000-120000	491c3912-26e5-455e-b361-115d24ddc053:100000-120000	491c3912_200bp.corr &
# perl drawTriangularCorr.pl 491c3912-26e5-455e-b361-115d24ddc053:100000-120000	491c3912-26e5-455e-b361-115d24ddc053:100000-120000	491c3912_2k.corr &
# perl drawTriangularCorr.pl 491c3912-26e5-455e-b361-115d24ddc053:100000-120000	491c3912-26e5-455e-b361-115d24ddc053:100000-120000	491c3912_500bp.corr &
# perl drawTriangularCorr.pl ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:100000-120000	ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:100000-120000	ccedfaa7_1k.corr &
# perl drawTriangularCorr.pl ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:100000-120000	ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:100000-120000	ccedfaa7_200bp.corr &
# perl drawTriangularCorr.pl ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:100000-120000	ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:100000-120000	ccedfaa7_2k.corr &
# perl drawTriangularCorr.pl ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:100000-120000	ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:100000-120000	ccedfaa7_500bp.corr &
# wait

perl show20Kb/pb/drawRepeatInAnyRegion.pl 41bca623.bed /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/testDepthAbnormalRegion/showReadsOnTheseRegion/repeat/candidate.reads.hl &
perl show20Kb/pb/drawRepeatInAnyRegion.pl 491c3912.bed /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/testDepthAbnormalRegion/showReadsOnTheseRegion/repeat/candidate.reads.hl &
perl show20Kb/pb/drawRepeatInAnyRegion.pl 2ed31109.bed /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/testDepthAbnormalRegion/showReadsOnTheseRegion/repeat/candidate.reads.hl &
perl show20Kb/pb/drawRepeatInAnyRegion.pl ccedfaa7.bed /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/testDepthAbnormalRegion/showReadsOnTheseRegion/repeat/candidate.reads.hl &
wait
# 491c3912-26e5-455e-b361-115d24ddc053:0-297508
# 2ed31109-15b8-4adb-ae8f-9538c6479764:0-314051
# ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:0-280455
# 41bca623-0639-4aa5-a342-d010620f1417:0-304356

perl drawTriangularCorr.pl 2ed31109-15b8-4adb-ae8f-9538c6479764:0-314051	2ed31109-15b8-4adb-ae8f-9538c6479764:0-314051  2ed31109_1k.corr
perl drawTriangularCorr.pl 2ed31109-15b8-4adb-ae8f-9538c6479764:0-314051	2ed31109-15b8-4adb-ae8f-9538c6479764:0-314051  2ed31109_200bp.corr
perl drawTriangularCorr.pl 2ed31109-15b8-4adb-ae8f-9538c6479764:0-314051	2ed31109-15b8-4adb-ae8f-9538c6479764:0-314051  2ed31109_2k.corr
perl drawTriangularCorr.pl 2ed31109-15b8-4adb-ae8f-9538c6479764:0-314051	2ed31109-15b8-4adb-ae8f-9538c6479764:0-314051  2ed31109_500bp.corr

perl drawTriangularCorr.pl 41bca623-0639-4aa5-a342-d010620f1417:0-304356	41bca623-0639-4aa5-a342-d010620f1417:0-304356  41bca623_1k.corr
perl drawTriangularCorr.pl 41bca623-0639-4aa5-a342-d010620f1417:0-304356	41bca623-0639-4aa5-a342-d010620f1417:0-304356  41bca623_200bp.corr
perl drawTriangularCorr.pl 41bca623-0639-4aa5-a342-d010620f1417:0-304356	41bca623-0639-4aa5-a342-d010620f1417:0-304356  41bca623_2k.corr
perl drawTriangularCorr.pl 41bca623-0639-4aa5-a342-d010620f1417:0-304356	41bca623-0639-4aa5-a342-d010620f1417:0-304356  41bca623_500bp.corr

perl drawTriangularCorr.pl 491c3912-26e5-455e-b361-115d24ddc053:0-297508	491c3912-26e5-455e-b361-115d24ddc053:0-297508  491c3912_1k.corr
perl drawTriangularCorr.pl 491c3912-26e5-455e-b361-115d24ddc053:0-297508	491c3912-26e5-455e-b361-115d24ddc053:0-297508  491c3912_200bp.corr
perl drawTriangularCorr.pl 491c3912-26e5-455e-b361-115d24ddc053:0-297508	491c3912-26e5-455e-b361-115d24ddc053:0-297508  491c3912_2k.corr
perl drawTriangularCorr.pl 491c3912-26e5-455e-b361-115d24ddc053:0-297508	491c3912-26e5-455e-b361-115d24ddc053:0-297508  491c3912_500bp.corr

perl drawTriangularCorr.pl ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:0-280455	ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:0-280455  ccedfaa7_1k.corr
perl drawTriangularCorr.pl ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:0-280455	ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:0-280455  ccedfaa7_200bp.corr
perl drawTriangularCorr.pl ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:0-280455	ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:0-280455  ccedfaa7_2k.corr
perl drawTriangularCorr.pl ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:0-280455	ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:0-280455  ccedfaa7_500bp.corr

perl drawTriangularCorr.pl 41bca623-0639-4aa5-a342-d010620f1417:0-304356	2ed31109-15b8-4adb-ae8f-9538c6479764:0-314051  41bca623_2ed31109_1k.corr
perl drawTriangularCorr.pl 41bca623-0639-4aa5-a342-d010620f1417:0-304356	2ed31109-15b8-4adb-ae8f-9538c6479764:0-314051  41bca623_2ed31109_200bp.corr
perl drawTriangularCorr.pl 41bca623-0639-4aa5-a342-d010620f1417:0-304356	2ed31109-15b8-4adb-ae8f-9538c6479764:0-314051  41bca623_2ed31109_2k.corr
perl drawTriangularCorr.pl 41bca623-0639-4aa5-a342-d010620f1417:0-304356	2ed31109-15b8-4adb-ae8f-9538c6479764:0-314051  41bca623_2ed31109_500bp.corr

perl drawTriangularCorr.pl 41bca623-0639-4aa5-a342-d010620f1417:0-304356	491c3912-26e5-455e-b361-115d24ddc053:0-297508  41bca623_491c3912_1k.corr
perl drawTriangularCorr.pl 41bca623-0639-4aa5-a342-d010620f1417:0-304356	491c3912-26e5-455e-b361-115d24ddc053:0-297508  41bca623_491c3912_200bp.corr
perl drawTriangularCorr.pl 41bca623-0639-4aa5-a342-d010620f1417:0-304356	491c3912-26e5-455e-b361-115d24ddc053:0-297508  41bca623_491c3912_2k.corr
perl drawTriangularCorr.pl 41bca623-0639-4aa5-a342-d010620f1417:0-304356	491c3912-26e5-455e-b361-115d24ddc053:0-297508  41bca623_491c3912_500bp.corr

perl drawTriangularCorr.pl 41bca623-0639-4aa5-a342-d010620f1417:0-304356	ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:0-280455  41bca623_ccedfaa7_1k.corr
perl drawTriangularCorr.pl 41bca623-0639-4aa5-a342-d010620f1417:0-304356	ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:0-280455  41bca623_ccedfaa7_200bp.corr
perl drawTriangularCorr.pl 41bca623-0639-4aa5-a342-d010620f1417:0-304356	ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:0-280455  41bca623_ccedfaa7_2k.corr
perl drawTriangularCorr.pl 41bca623-0639-4aa5-a342-d010620f1417:0-304356	ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:0-280455  41bca623_ccedfaa7_500bp.corr


perl drawTriangularCorr.pl ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:0-280455	2ed31109-15b8-4adb-ae8f-9538c6479764:0-314051  ccedfaa7_2ed31109_1k.corr
perl drawTriangularCorr.pl ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:0-280455	2ed31109-15b8-4adb-ae8f-9538c6479764:0-314051  ccedfaa7_2ed31109_200bp.corr
perl drawTriangularCorr.pl ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:0-280455	2ed31109-15b8-4adb-ae8f-9538c6479764:0-314051  ccedfaa7_2ed31109_2k.corr
perl drawTriangularCorr.pl ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:0-280455	2ed31109-15b8-4adb-ae8f-9538c6479764:0-314051  ccedfaa7_2ed31109_500bp.corr

perl drawTriangularCorr.pl ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:0-280455	491c3912-26e5-455e-b361-115d24ddc053:0-297508  ccedfaa7_491c3912_1k.corr
perl drawTriangularCorr.pl ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:0-280455	491c3912-26e5-455e-b361-115d24ddc053:0-297508  ccedfaa7_491c3912_200bp.corr
perl drawTriangularCorr.pl ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:0-280455	491c3912-26e5-455e-b361-115d24ddc053:0-297508  ccedfaa7_491c3912_2k.corr
perl drawTriangularCorr.pl ccedfaa7-d2dd-4b9e-ae6a-d41882c594a4:0-280455	491c3912-26e5-455e-b361-115d24ddc053:0-297508  ccedfaa7_491c3912_500bp.corr

