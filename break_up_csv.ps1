#This job took a csv with 2.5M rows and broke it up into 10 files to be used in Excel. Excel's limit is 1M rows

$Counter = 1
do{
   $folder = 'C:\Users\crims\Desktop\'
   $file = 'ca_bls_age65_hotzipcodesSoCal_dedupe'
  $folderPath = "$folder$file.csv"
  $FileRows = 250000
  $SkipCount = ($Counter -1)*$FileRows 
  $folderPathDest = "$folder$fi" + '_' + $Counter + '.csv'
  Import-Csv $folderPath | Select -First $FileRows -Skip $SkipCount | Export-Csv -Path $folderPathDest –NoTypeInformation
  $Counter = $Counter +1
  } until ($Counter -eq 10)
