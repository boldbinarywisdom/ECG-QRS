function Test_3_QRS_Peaks()

load('100m.mat')

time = 10;
length(val)
Fs = length(val)/time
val=flip(val);

x=val;
%Order of FIR system
Number_of_coefficient = 100;

%Number of filters
N = 3;
total_zeros = (Number_of_coefficient)*N;
val = [val zeros(1,total_zeros)];
y=0;

%To remove baseline wander noise
%High-pass - cutt-off .05 Hz
b=fir1(Number_of_coefficient,1/3600,'high');
y = y + 25*filter(b,1,5*val);
%Low pass - cut-off 150 Hz
b=fir1(Number_of_coefficient,150/180);
y = y + filter(b,1,val);

%To remove power-line noise - 
%100 coefficient FIR stopband filter 59.95 Hz-60.05 Hz 
bandstop_100 = [0.000261250076794666,-0.000261900362214270,-0.000525076606165565,-0.000263163851507842,0.000263776960520398,0.000528755168156876,0.000264965677070068,-0.000265541195318743,-0.000532208191171410,-0.000266654335574226,0.000267191873933590,0.000535433340523649,0.000268228685109245,-0.000268727879982831,-0.000538428434695909,-0.000269687660632511,0.000270148174230353,0.000541191447005755,0.000271030274783530,-0.000271451795379894,-0.000543720507153249,-0.000272255618637699,0.000272637860809924,0.000546013902649643,0.000273362862401081,-0.000273705567247171,-0.000548070080127131,-0.000274351256044557,0.000274654191381137,0.000549887646524771,0.000275220129877241,-0.000275483090417148,-0.000551465370154558,-0.000275968895058024,0.000276191702567049,0.000552802181641874,0.000276597044045659,-0.000276779547479204,-0.000553897174743603,-0.000277104150987441,0.000277246226605518,0.000554749607041532,0.000277489872044696,-0.000277591423506837,-0.000555358900509558,-0.000277753945654961,0.000277814904093941,0.000555724641955639,0.000277896192733116,-0.000277916516807400,0.999968003425341,-0.000277916516807400,0.000277896192733116,0.000555724641955639,0.000277814904093941,-0.000277753945654961,-0.000555358900509558,-0.000277591423506837,0.000277489872044696,0.000554749607041532,0.000277246226605518,-0.000277104150987441,-0.000553897174743603,-0.000276779547479204,0.000276597044045659,0.000552802181641874,0.000276191702567049,-0.000275968895058024,-0.000551465370154558,-0.000275483090417148,0.000275220129877241,0.000549887646524771,0.000274654191381137,-0.000274351256044557,-0.000548070080127131,-0.000273705567247171,0.000273362862401081,0.000546013902649643,0.000272637860809924,-0.000272255618637699,-0.000543720507153249,-0.000271451795379894,0.000271030274783530,0.000541191447005755,0.000270148174230353,-0.000269687660632511,-0.000538428434695909,-0.000268727879982831,0.000268228685109245,0.000535433340523649,0.000267191873933590,-0.000266654335574226,-0.000532208191171410,-0.000265541195318743,0.000264965677070068,0.000528755168156876,0.000263776960520398,-0.000263163851507842,-0.000525076606165565,-0.000261900362214270,0.000261250076794666];
%1000 coefficient FIR stopband filter 59.95 Hz-60.05 Hz 
bandstop_1000 = [0.000253114811495925,-0.000253210549311385,-0.000506612244008795,-0.000253401529420926,0.000253496771407494,0.000507183695621356,0.000253686758477064,-0.000253781503254110,-0.000507752163977610,-0.000253970494528878,0.000254064740722080,0.000508317640833345,0.000254252733460746,-0.000254346479703108,-0.000508880117985285,-0.000254533471178260,0.000254626716109651,0.000509439587272300,0.000254812703607761,-0.000254905445874617,-0.000509996040574467,-0.000255090426695992,0.000255182664952082,0.000510549469813447,0.000255366636411046,-0.000255458369317155,-0.000511099866953457,-0.000255641328742001,0.000255732554965531,0.000511647224000191,0.000255914499698577,-0.000256005217914338,-0.000512191533002058,-0.000256186145312099,0.000256276354201995,0.000512732786049551,0.000256456261635014,-0.000256545959887606,-0.000513270975275556,-0.000256724844740724,0.000256814031052295,0.000513806092856227,0.000256991890724389,-0.000257080563797874,-0.000514338131009964,-0.000257257395702624,0.000257345554248167,0.000514867081998282,0.000257521355813121,-0.000257608998548437,-0.000515392938126133,-0.000257783767215730,0.000257870892865214,0.000515915691741390,0.000258044626091349,-0.000258131233387037,-0.000516435335235300,-0.000258303928643133,0.000258390016324357,0.000516951861043171,0.000258561671095970,-0.000258647237908829,-0.000517465261643280,-0.000258817849696183,0.000258902894394583,0.000517975529558481,0.000259072460712492,-0.000259156982057704,-0.000518482657355144,-0.000259325500435658,0.000259409497195762,0.000518986637643647,0.000259576965178029,-0.000259660436129194,-0.000519487463079302,-0.000259826851274605,0.000259909795199847,0.000519985126361081,0.000260075155082597,-0.000260157570772425,-0.000520479620232755,-0.000260321872981040,0.000260403759233796,0.000520970937483078,0.000260567001371964,-0.000260648356992907,-0.000521459070945283,-0.000260810536679226,0.000260891360481558,0.000521944013497389,0.000261052475349553,-0.000261132766154009,-0.000522425758063169,-0.000261292813852369,0.000261372570486731,0.000522904297610948,0.000261531548679159,-0.000261610769979230,-0.000523379625154561,-0.000261768676344635,0.000261847361153819,0.000523851733753684,0.000262004193386283,-0.000262082340555093,-0.000524320616513038,-0.000262238096363870,0.000262315704750917,0.000524786266583793,0.000262470381860612,-0.000262547450332208,-0.000525248677162384,-0.000262701046482660,0.000262777573912198,0.000525707841491291,0.000262930086858683,-0.000263006072128013,-0.000526163752859622,-0.000263157499640942,0.000263232941639034,0.000526616404602294,0.000263383281504890,-0.000263458179128491,-0.000527065790100562,-0.000263607429148642,0.000263681781302717,0.000527511902782793,0.000263829939294250,-0.000263903744890929,-0.000527954736123305,-0.000264050808686458,0.000264124066646116,0.000528394283643348,0.000264270034093943,-0.000264342743344845,-0.000528830538911447,-0.000264487612308824,0.000264559771786427,0.000529263495542552,0.000264703540146206,-0.000264775148794416,-0.000529693147199323,-0.000264917814445312,0.000264988871215973,0.000530119487591276,0.000265130432069053,-0.000265200935921224,-0.000530542510475100,-0.000265341389903414,0.000265411339804748,0.000530962209655702,0.000265550684858773,-0.000265620079784755,-0.000531378578984954,-0.000265758313869290,0.000265827152802875,0.000531791612362487,0.000265964273892433,-0.000266032555825259,-0.000532201303736231,-0.000266168561910208,0.000266236285841371,0.000532607647101654,0.000266371174928593,-0.000266438339865080,-0.000533010636502081,-0.000266572109977036,0.000266638714934629,0.000533410266029840,0.000266771364109877,-0.000266837408111480,-0.000533806529824722,-0.000266968934404831,0.000267034416482094,0.000534199422075112,0.000267164817964410,-0.000267229737156917,-0.000534588937018400,-0.000267359011915352,0.000267423367270626,0.000534975068939838,0.000267551513408439,-0.000267615303982194,-0.000535357812173995,-0.000267742319619077,0.000267805544475150,0.000535737161103960,0.000267931427746782,-0.000267994085957208,-0.000536113110162088,-0.000268118835016080,0.000268180925661043,0.000536485653829230,0.000268304538675612,-0.000268366060843554,-0.000536854786635944,-0.000268488535998778,0.000268549488786141,0.000537220503161830,0.000268670824283449,-0.000268731206795332,-0.000537582798035665,-0.000268851400852604,0.000268911212201903,0.000537941665935980,0.000269030263053558,-0.000269089502361660,-0.000538297101590871,-0.000269207408258485,0.000269266074654937,0.000538649099777871,0.000269382833864701,-0.000269440926487463,-0.000538997655324257,-0.000269556537294110,0.000269614055289334,0.000539342763107417,0.000269728515993684,-0.000269785458515905,-0.000539684418054762,-0.000269898767435211,0.000269955133647325,0.000540022615143198,0.000270067289115971,-0.000270123078189260,-0.000540357349400404,-0.000270234078557886,0.000270289289671918,0.000540688615903929,0.000270399133308215,-0.000270453765650887,-0.000541016409781980,-0.000270562450939196,0.000270616503707150,0.000541340726212803,0.000270724029048765,-0.000270777501446725,-0.000541661560425433,-0.000270883865259648,0.000270936756500870,0.000541978907699586,0.000271041957220023,-0.000271094266526226,-0.000542292763365207,-0.000271198302603705,0.000271250029205042,0.000542603122803642,0.000271352899109660,-0.000271404042244722,-0.000542909981446710,-0.000271505744462220,0.000271556303378132,0.000543213334777616,0.000271656836411295,-0.000271706810363936,-0.000543513178329840,-0.000271806172732635,0.000271855560986129,0.000543809507688921,0.000271953751227220,-0.000272002553054243,-0.000544102318491202,-0.000272099569721604,0.000272147784403428,0.000544391606423957,0.000272243626068465,-0.000272291252894904,-0.000544677367226468,-0.000272385918145742,0.000272432956415248,0.000544959596689196,0.000272526443857271,-0.000272572892876683,-0.000545238290654343,-0.000272665201132543,0.000272711060217733,0.000545513445015269,0.000272802187927270,-0.000272847456402348,-0.000545785055717468,-0.000272937402222582,0.000272982079420449,0.000546053118758178,0.000273070842025654,-0.000273114927287773,-0.000546317630186548,-0.000273202505369896,0.000273245998046439,0.000546578586103243,0.000273332390314300,-0.000273375289764093,-0.000546835982661307,-0.000273460494944008,0.000273502800534573,0.000547089816066001,0.000273586817370088,-0.000273628528477624,-0.000547340082574179,-0.000273711355730169,0.000273752471739567,0.000547586778495436,0.000273834108187519,-0.000273874628492384,-0.000547829900191448,-0.000273955072931512,0.000273994996934204,0.000548069444076618,0.000274074248178302,-0.000274113575289907,-0.000548305406616968,-0.000274191632169713,0.000274230361810070,0.000548537784331693,0.000274307223174016,-0.000274345354771706,-0.000548766573792669,-0.000274421019485576,0.000274458552477983,0.000548991771623684,0.000274533019425699,-0.000274569953258945,-0.000549213374501845,-0.000274643221341380,0.000274679555470440,0.000549431379156826,0.000274751623606084,-0.000274787357494708,-0.000549645782371282,-0.000274858224620243,0.000274893357740994,0.000549856580980286,0.000274963022810265,-0.000274997554644498,-0.000550063771872317,-0.000275066016629027,0.000275099946667015,0.000550267351988923,0.000275167204555886,-0.000275200532296674,-0.000550467318324115,-0.000275266585097303,0.000275299310048775,0.000550663667925510,0.000275364156785677,-0.000275396278464555,-0.000550856397893962,-0.000275459918180081,0.000275491436112246,0.000551045505383156,0.000275553867866542,-0.000275584781586355,-0.000551230987600468,-0.000275646004457574,0.000275676313508495,0.000551412841806376,0.000275736326592138,-0.000275766030526486,-0.000551591065314809,-0.000275824832936309,0.000275853931315351,0.000551765655493201,0.000275911522182483,-0.000275940014576351,-0.000551936609762222,-0.000275996393050321,0.000276024279038017,0.000552103925596464,0.000276079444285589,-0.000276106723455149,-0.000552267600523855,-0.000276160674661523,0.000276187346609706,0.000552427632126093,0.000276240082977610,-0.000276266147310645,-0.000552584018038277,-0.000276317668060590,0.000276343124393152,0.000552736755949655,0.000276393428764112,-0.000276418276719958,-0.000552885843603112,-0.000276467363968210,0.000276491603180153,0.000553031278794862,0.000276539472580498,-0.000276563102690278,-0.000553173059375836,-0.000276609753534857,0.000276632774193242,0.000553311183250021,0.000276678205792779,-0.000276700616659292,-0.000553445648376131,-0.000276744828342155,0.000276766629085840,0.000553576452766131,0.000276809620198423,-0.000276830810496633,-0.000553703594486581,-0.000276872580403426,0.000276893159943228,0.000553827071657483,0.000276933708026472,-0.000276953676503463,-0.000553946882453776,-0.000276993002164015,0.000277012359282958,0.000554063025103665,0.000277050461938997,-0.000277069207413688,-0.000554175497889811,-0.000277106086502177,0.000277124220055221,0.000554284299149419,0.000277159875030630,-0.000277177396394312,-0.000554389427273313,-0.000277211826729423,0.000277228735644163,0.000554490880707301,0.000277261940829811,-0.000277278237046047,-0.000554588657950612,-0.000277310216591087,0.000277325899867410,0.000554682757557318,0.000277356653299092,-0.000277371723403707,-0.000554773178135842,-0.000277401250267069,0.000277415706977027,0.000554859918348799,0.000277444006835422,-0.000277457849936984,-0.000554942976913247,-0.000277484922371571,0.000277498151660128,0.000555022352600659,0.000277523996270701,-0.000277536611550384,-0.000555098044237093,-0.000277561227954584,0.000277573229038824,0.000555170050702587,0.000277596616872577,-0.000277608003583752,-0.000555238370932167,-0.000277630162501083,0.000277640934670876,0.000555303003915272,0.000277661864343952,-0.000277672021812822,-0.000555363948695646,-0.000277691721932203,0.000277701264550016,0.000555421204371690,0.000277719734823936,-0.000277728662449673,-0.000555474770096409,-0.000277745902605047,0.000277754215106488,0.000555524645077572,0.000277770224888284,-0.000277777922142479,-0.000555570828576853,-0.000277792701313722,0.000277799783206833,0.000555613319911258,0.000277813331548985,-0.000277819797975989,-0.000555652118452218,-0.000277832115288739,0.000277837966154116,0.000555687223625326,0.000277849052255001,-0.000277854287472208,-0.000555718634911524,-0.000277864142197164,0.000277868761688719,0.000555746351845789,0.000277877384892151,-0.000277881388589751,-0.000555770374018387,-0.000277888780144037,0.000277892167988351,0.000555790701073710,0.000277898327783949,-0.000277901099725018,-0.000555807332710784,-0.000277906027670698,0.000277908183667425,0.000555820268683721,0.000277911879690620,-0.000277913419711061,-0.000555829508801192,-0.000277915883756822,0.000277916807778235,0.000555835052926336,0.000277918039810284,-0.000277918347818900,0.999950584857827,-0.000277918347818900,0.000277918039810284,0.000555835052926336,0.000277916807778235,-0.000277915883756822,-0.000555829508801192,-0.000277913419711061,0.000277911879690620,0.000555820268683721,0.000277908183667425,-0.000277906027670698,-0.000555807332710784,-0.000277901099725018,0.000277898327783949,0.000555790701073710,0.000277892167988351,-0.000277888780144037,-0.000555770374018387,-0.000277881388589751,0.000277877384892151,0.000555746351845789,0.000277868761688719,-0.000277864142197164,-0.000555718634911524,-0.000277854287472208,0.000277849052255001,0.000555687223625326,0.000277837966154116,-0.000277832115288739,-0.000555652118452218,-0.000277819797975989,0.000277813331548985,0.000555613319911258,0.000277799783206833,-0.000277792701313722,-0.000555570828576853,-0.000277777922142479,0.000277770224888284,0.000555524645077572,0.000277754215106488,-0.000277745902605047,-0.000555474770096409,-0.000277728662449673,0.000277719734823936,0.000555421204371690,0.000277701264550016,-0.000277691721932203,-0.000555363948695646,-0.000277672021812822,0.000277661864343952,0.000555303003915272,0.000277640934670876,-0.000277630162501083,-0.000555238370932167,-0.000277608003583752,0.000277596616872577,0.000555170050702587,0.000277573229038824,-0.000277561227954584,-0.000555098044237093,-0.000277536611550384,0.000277523996270701,0.000555022352600659,0.000277498151660128,-0.000277484922371571,-0.000554942976913247,-0.000277457849936984,0.000277444006835422,0.000554859918348799,0.000277415706977027,-0.000277401250267069,-0.000554773178135842,-0.000277371723403707,0.000277356653299092,0.000554682757557318,0.000277325899867410,-0.000277310216591087,-0.000554588657950612,-0.000277278237046047,0.000277261940829811,0.000554490880707301,0.000277228735644163,-0.000277211826729423,-0.000554389427273313,-0.000277177396394312,0.000277159875030630,0.000554284299149419,0.000277124220055221,-0.000277106086502177,-0.000554175497889811,-0.000277069207413688,0.000277050461938997,0.000554063025103665,0.000277012359282958,-0.000276993002164015,-0.000553946882453776,-0.000276953676503463,0.000276933708026472,0.000553827071657483,0.000276893159943228,-0.000276872580403426,-0.000553703594486581,-0.000276830810496633,0.000276809620198423,0.000553576452766131,0.000276766629085840,-0.000276744828342155,-0.000553445648376131,-0.000276700616659292,0.000276678205792779,0.000553311183250021,0.000276632774193242,-0.000276609753534857,-0.000553173059375836,-0.000276563102690278,0.000276539472580498,0.000553031278794862,0.000276491603180153,-0.000276467363968210,-0.000552885843603112,-0.000276418276719958,0.000276393428764112,0.000552736755949655,0.000276343124393152,-0.000276317668060590,-0.000552584018038277,-0.000276266147310645,0.000276240082977610,0.000552427632126093,0.000276187346609706,-0.000276160674661523,-0.000552267600523855,-0.000276106723455149,0.000276079444285589,0.000552103925596464,0.000276024279038017,-0.000275996393050321,-0.000551936609762222,-0.000275940014576351,0.000275911522182483,0.000551765655493201,0.000275853931315351,-0.000275824832936309,-0.000551591065314809,-0.000275766030526486,0.000275736326592138,0.000551412841806376,0.000275676313508495,-0.000275646004457574,-0.000551230987600468,-0.000275584781586355,0.000275553867866542,0.000551045505383156,0.000275491436112246,-0.000275459918180081,-0.000550856397893962,-0.000275396278464555,0.000275364156785677,0.000550663667925510,0.000275299310048775,-0.000275266585097303,-0.000550467318324115,-0.000275200532296674,0.000275167204555886,0.000550267351988923,0.000275099946667015,-0.000275066016629027,-0.000550063771872317,-0.000274997554644498,0.000274963022810265,0.000549856580980286,0.000274893357740994,-0.000274858224620243,-0.000549645782371282,-0.000274787357494708,0.000274751623606084,0.000549431379156826,0.000274679555470440,-0.000274643221341380,-0.000549213374501845,-0.000274569953258945,0.000274533019425699,0.000548991771623684,0.000274458552477983,-0.000274421019485576,-0.000548766573792669,-0.000274345354771706,0.000274307223174016,0.000548537784331693,0.000274230361810070,-0.000274191632169713,-0.000548305406616968,-0.000274113575289907,0.000274074248178302,0.000548069444076618,0.000273994996934204,-0.000273955072931512,-0.000547829900191448,-0.000273874628492384,0.000273834108187519,0.000547586778495436,0.000273752471739567,-0.000273711355730169,-0.000547340082574179,-0.000273628528477624,0.000273586817370088,0.000547089816066001,0.000273502800534573,-0.000273460494944008,-0.000546835982661307,-0.000273375289764093,0.000273332390314300,0.000546578586103243,0.000273245998046439,-0.000273202505369896,-0.000546317630186548,-0.000273114927287773,0.000273070842025654,0.000546053118758178,0.000272982079420449,-0.000272937402222582,-0.000545785055717468,-0.000272847456402348,0.000272802187927270,0.000545513445015269,0.000272711060217733,-0.000272665201132543,-0.000545238290654343,-0.000272572892876683,0.000272526443857271,0.000544959596689196,0.000272432956415248,-0.000272385918145742,-0.000544677367226468,-0.000272291252894904,0.000272243626068465,0.000544391606423957,0.000272147784403428,-0.000272099569721604,-0.000544102318491202,-0.000272002553054243,0.000271953751227220,0.000543809507688921,0.000271855560986129,-0.000271806172732635,-0.000543513178329840,-0.000271706810363936,0.000271656836411295,0.000543213334777616,0.000271556303378132,-0.000271505744462220,-0.000542909981446710,-0.000271404042244722,0.000271352899109660,0.000542603122803642,0.000271250029205042,-0.000271198302603705,-0.000542292763365207,-0.000271094266526226,0.000271041957220023,0.000541978907699586,0.000270936756500870,-0.000270883865259648,-0.000541661560425433,-0.000270777501446725,0.000270724029048765,0.000541340726212803,0.000270616503707150,-0.000270562450939196,-0.000541016409781980,-0.000270453765650887,0.000270399133308215,0.000540688615903929,0.000270289289671918,-0.000270234078557886,-0.000540357349400404,-0.000270123078189260,0.000270067289115971,0.000540022615143198,0.000269955133647325,-0.000269898767435211,-0.000539684418054762,-0.000269785458515905,0.000269728515993684,0.000539342763107417,0.000269614055289334,-0.000269556537294110,-0.000538997655324257,-0.000269440926487463,0.000269382833864701,0.000538649099777871,0.000269266074654937,-0.000269207408258485,-0.000538297101590871,-0.000269089502361660,0.000269030263053558,0.000537941665935980,0.000268911212201903,-0.000268851400852604,-0.000537582798035665,-0.000268731206795332,0.000268670824283449,0.000537220503161830,0.000268549488786141,-0.000268488535998778,-0.000536854786635944,-0.000268366060843554,0.000268304538675612,0.000536485653829230,0.000268180925661043,-0.000268118835016080,-0.000536113110162088,-0.000267994085957208,0.000267931427746782,0.000535737161103960,0.000267805544475150,-0.000267742319619077,-0.000535357812173995,-0.000267615303982194,0.000267551513408439,0.000534975068939838,0.000267423367270626,-0.000267359011915352,-0.000534588937018400,-0.000267229737156917,0.000267164817964410,0.000534199422075112,0.000267034416482094,-0.000266968934404831,-0.000533806529824722,-0.000266837408111480,0.000266771364109877,0.000533410266029840,0.000266638714934629,-0.000266572109977036,-0.000533010636502081,-0.000266438339865080,0.000266371174928593,0.000532607647101654,0.000266236285841371,-0.000266168561910208,-0.000532201303736231,-0.000266032555825259,0.000265964273892433,0.000531791612362487,0.000265827152802875,-0.000265758313869290,-0.000531378578984954,-0.000265620079784755,0.000265550684858773,0.000530962209655702,0.000265411339804748,-0.000265341389903414,-0.000530542510475100,-0.000265200935921224,0.000265130432069053,0.000530119487591276,0.000264988871215973,-0.000264917814445312,-0.000529693147199323,-0.000264775148794416,0.000264703540146206,0.000529263495542552,0.000264559771786427,-0.000264487612308824,-0.000528830538911447,-0.000264342743344845,0.000264270034093943,0.000528394283643348,0.000264124066646116,-0.000264050808686458,-0.000527954736123305,-0.000263903744890929,0.000263829939294250,0.000527511902782793,0.000263681781302717,-0.000263607429148642,-0.000527065790100562,-0.000263458179128491,0.000263383281504890,0.000526616404602294,0.000263232941639034,-0.000263157499640942,-0.000526163752859622,-0.000263006072128013,0.000262930086858683,0.000525707841491291,0.000262777573912198,-0.000262701046482660,-0.000525248677162384,-0.000262547450332208,0.000262470381860612,0.000524786266583793,0.000262315704750917,-0.000262238096363870,-0.000524320616513038,-0.000262082340555093,0.000262004193386283,0.000523851733753684,0.000261847361153819,-0.000261768676344635,-0.000523379625154561,-0.000261610769979230,0.000261531548679159,0.000522904297610948,0.000261372570486731,-0.000261292813852369,-0.000522425758063169,-0.000261132766154009,0.000261052475349553,0.000521944013497389,0.000260891360481558,-0.000260810536679226,-0.000521459070945283,-0.000260648356992907,0.000260567001371964,0.000520970937483078,0.000260403759233796,-0.000260321872981040,-0.000520479620232755,-0.000260157570772425,0.000260075155082597,0.000519985126361081,0.000259909795199847,-0.000259826851274605,-0.000519487463079302,-0.000259660436129194,0.000259576965178029,0.000518986637643647,0.000259409497195762,-0.000259325500435658,-0.000518482657355144,-0.000259156982057704,0.000259072460712492,0.000517975529558481,0.000258902894394583,-0.000258817849696183,-0.000517465261643280,-0.000258647237908829,0.000258561671095970,0.000516951861043171,0.000258390016324357,-0.000258303928643133,-0.000516435335235300,-0.000258131233387037,0.000258044626091349,0.000515915691741390,0.000257870892865214,-0.000257783767215730,-0.000515392938126133,-0.000257608998548437,0.000257521355813121,0.000514867081998282,0.000257345554248167,-0.000257257395702624,-0.000514338131009964,-0.000257080563797874,0.000256991890724389,0.000513806092856227,0.000256814031052295,-0.000256724844740724,-0.000513270975275556,-0.000256545959887606,0.000256456261635014,0.000512732786049551,0.000256276354201995,-0.000256186145312099,-0.000512191533002058,-0.000256005217914338,0.000255914499698577,0.000511647224000191,0.000255732554965531,-0.000255641328742001,-0.000511099866953457,-0.000255458369317155,0.000255366636411046,0.000510549469813447,0.000255182664952082,-0.000255090426695992,-0.000509996040574467,-0.000254905445874617,0.000254812703607761,0.000509439587272300,0.000254626716109651,-0.000254533471178260,-0.000508880117985285,-0.000254346479703108,0.000254252733460746,0.000508317640833345,0.000254064740722080,-0.000253970494528878,-0.000507752163977610,-0.000253781503254110,0.000253686758477064,0.000507183695621356,0.000253496771407494,-0.000253401529420926,-0.000506612244008795,-0.000253210549311385,0.000253114811495925];
y = y + filter(bandstop_100,1,val);
start_remove = Number_of_coefficient/2;
end_remove = total_zeros-start_remove;
y = y(start_remove+1:end-end_remove);

ecg=y;
f_y=0;
[p,s,mu] = polyfit((1:numel(ecg)),ecg,6);
f_y = polyval(p,(1:numel(ecg)),[],mu);

ECG_data = ecg - f_y;        % Detrend data

figure
plot(ECG_data)
grid on

title('Detrended ECG Signal')
xlabel('Samples')
ylabel('Voltage(mV)')
legend('Detrended ECG Signal')


[~,R_loc] = findpeaks(ECG_data,'MinPeakHeight',0.5,'MinPeakDistance',200);
ECG_inverted = -ECG_data;
[~,S_loc] = findpeaks(ECG_inverted,'MinPeakHeight',0.5,'MinPeakDistance',200);
[~,Q_loc] = findpeaks(flip(ECG_inverted),'MinPeakHeight',0.5,'MinPeakDistance',200);

smoothECG = sgolayfilt(ECG_data,7,21);
figure
hold on
plot(smoothECG); 
plot(Q_loc,smoothECG(Q_loc),'rs','MarkerFaceColor','g')
plot(R_loc,smoothECG(R_loc),'rv','MarkerFaceColor','r')
plot(S_loc,smoothECG(S_loc),'rs','MarkerFaceColor','b')
grid on
title('Identified RS Peaks in Signal')
xlabel('Samples')
ylabel('Voltage(mV)')
% ax = axis;
% axis([0 1850 -1.1 1.1])
legend('Smooth ECG signal','R-wave','S-wave')

end

function plotECG(matName,infoName)

% usage: plotATM('RECORDm.mat', 'RECORDm.info')
%
% This function reads a pair of files generated by 'wfdb2mat' from a
% PhysioBank record, baseline-corrects and scales the time series
% contained in the .mat file, and plots them.  The baseline-corrected
% and scaled time series are the rows of matrix 'val', and each
% column contains simultaneous samples of each time series.
%
% 'wfdb2mat' is part of the open-source WFDB Software Package available at
%    http://physionet.org/physiotools/wfdb.shtml
% If you have installed a working copy of 'wfdb2mat', run a shell command
% such as
%    wfdb2mat -r 100s -f 0 -t 10 >100sm.info
% to create a pair of files ('100sm.mat', '100sm.info') that can be read
% by this function.
%
% The files needed by this function can also be produced by the
% PhysioBank ATM, at
%    http://physionet.org/cgi-bin/ATM
%

% plotATM.m           O. Abdala			16 March 2009

  Octave = exist('OCTAVE_VERSION');
  load(matName);
  fid = fopen(infoName, 'rt');
  fgetl(fid);
  fgetl(fid);
  fgetl(fid);
  [freqint] = sscanf(fgetl(fid),'Sampling frequency: %f Hz  Sampling interval: %f sec');
  interval = freqint(2);
  fgetl(fid);
  if(Octave)
    for i=1:size(val,1)
      R=split(fgetl(fid),char(9));
      signal{i} = R(2,:);
      gain(i) = str2num(R(3,:));
      base(i) = str2num(R(4,:));
      units{i} = R(5,:);
    end
  else
    for i=1:size(val,1)
      [row(i), signal(i), gain(i), base(i), units(i)]=strread(fgetl(fid),'%d%s%f%f%s','delimiter','\t');
    end
  end
  fclose(fid);
  val(val==-32768) = NaN;
  for i=1:size(val,1)
    val(i,:) = (val(i,:)-base(i))/gain(i);
  end
  x = (1:size(val,2))*interval;
  plot(x',val');
  for i=1:length(signal),labels{i}=strcat(signal{i},' (',units{i},')'); end
  legend(labels);
  xlabel('Time (sec)');
end