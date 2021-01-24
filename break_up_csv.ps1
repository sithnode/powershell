#This job took a csv with 2.5M rows and broke it up into 10 files to be used in Excel. Excel's limit is 1M rows

$Counter = 1
do{

  $folderPath = 'F:\SQL\Input\Assessor_Parcels_Data_-_2018.csv'
  $FileRows = 250000
  $SkipCount = ($Counter -1)*$FileRows 
  $folderPathDest = 'F:\SQL\Output\Partitioned_Files\Assessor_Output' + $Counter + '.csv'
  Import-Csv $folderPath | Select -First $FileRows -Skip $SkipCount | Export-Csv -Path $folderPathDest –NoTypeInformation
  $Counter = $Counter +1
  } until ($Counter -eq 10)
  
  
