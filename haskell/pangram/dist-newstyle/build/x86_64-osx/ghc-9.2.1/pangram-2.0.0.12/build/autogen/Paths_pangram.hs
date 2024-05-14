{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_pangram (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [2,0,0,12] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/Users/zbynekjurica/.cabal/bin"
libdir     = "/Users/zbynekjurica/.cabal/lib/x86_64-osx-ghc-9.2.1/pangram-2.0.0.12-inplace"
dynlibdir  = "/Users/zbynekjurica/.cabal/lib/x86_64-osx-ghc-9.2.1"
datadir    = "/Users/zbynekjurica/.cabal/share/x86_64-osx-ghc-9.2.1/pangram-2.0.0.12"
libexecdir = "/Users/zbynekjurica/.cabal/libexec/x86_64-osx-ghc-9.2.1/pangram-2.0.0.12"
sysconfdir = "/Users/zbynekjurica/.cabal/etc"

getBinDir     = catchIO (getEnv "pangram_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "pangram_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "pangram_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "pangram_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "pangram_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "pangram_sysconfdir") (\_ -> return sysconfdir)



joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
