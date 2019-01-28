module HomeDirectory where
import System.Directory (getHomeDirectory)

myHomeDirectory :: IO String
myHomeDirectory = do
	myDir <- getHomeDirectory
	return myDir

