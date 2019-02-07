module TaskAdd where
import System.IO
import GetContentsOfConfigFile
import SplitOn
import Data.List
import System.Environment -- getArgs
import ConfigFile

-- read the first `empty` ID from config file

findFirstFreeId :: [Int] -> Int
findFirstFreeId [] = undefined
findFirstFreeId (x:xs)
	| elem nextX xs = findFirstFreeId xs
	| otherwise     = nextX
	where nextX = x + 1

readToInt :: [String] -> [Int]
readToInt = map read

firstFreeId :: IO Int
firstFreeId = do	
	contentsOfConfigFile <- getContentsOfConfigFile
	let contentsAsLines = splitOnNewLine contentsOfConfigFile
	putStrLn $ "head contentsAsLines"
	putStrLn $ head contentsAsLines
	let firstItemsInLine = readToInt $ map head $ map ( splitOn ',' ) contentsAsLines
	putStrLn "unwords $ map show firstItemsInLine"
	putStrLn $ unwords $ map show firstItemsInLine
	let result = findFirstFreeId firstItemsInLine
	return result

getSecondArg :: IO String
getSecondArg = do
	args <- getArgs
	return (args !! 1)

taskAdd :: IO ()
taskAdd = do
	putStrLn "TaskAdd"
	contentsOfConfigFile <- getContentsOfConfigFile
	putStrLn $ contentsOfConfigFile
	
	putStrLn "TaskAdd end"

	num <- firstFreeId
	let numAsString = show $ num
	putStrLn numAsString

	secondArg <- getSecondArg
	putStrLn secondArg
	--let lineToBeAppended = (show $ num) ++ ", " ++ secondArg
	let lineToBeAppended = (show $ num) ++ ", "
	putStrLn "lineToBeAppended"
	putStrLn lineToBeAppended
	pathOfConfigFile <- getPathOfConfigFile
	appendFile pathOfConfigFile lineToBeAppended

	putStrLn $ numAsString 
	
