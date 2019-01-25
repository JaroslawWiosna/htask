module CheckIfFileExists where
import System.Directory (doesFileExist)
 
check :: (FilePath -> IO Bool) -> FilePath -> IO ()
check p s = do
	result <- p s
	putStrLn $
		s ++
		if result
			then " exists"
			else " does not exist"


