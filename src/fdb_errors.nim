 {.deadCodeElim: on.}
when defined(windows):
  const
    libforestdb* = "libforestdb.dll"
elif defined(macosx):
  const
    libforestdb* = "libforestdb.dylib"
else:
  const
    libforestdb* = "libforestdb.so"
##  -*- Mode: C++; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
##
##      Copyright 2010 Couchbase, Inc
##
##    Licensed under the Apache License, Version 2.0 (the "License");
##    you may not use this file except in compliance with the License.
##    You may obtain a copy of the License at
##
##        http://www.apache.org/licenses/LICENSE-2.0
##
##    Unless required by applicable law or agreed to in writing, software
##    distributed under the License is distributed on an "AS IS" BASIS,
##    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
##    See the License for the specific language governing permissions and
##    limitations under the License.
##

## *
##  Status values returned by calling ForestDB APIs.
##

type                          ## *
    ##  ForestDB operation success.
    ##
  fdb_status* {.size: sizeof(cint).} = enum
    FDB_RESULT_FILE_VERSION_NOT_SUPPORTED = - 49, FDB_RESULT_SB_READ_FAIL = - 48, ## *
                                                                          ##  Fail to read old version database file.
                                                                          ##
    FDB_RESULT_SB_RACE_CONDITION = - 47, ## *
                                     ##  Fail to read superblock.
                                     ##
    FDB_RESULT_SB_INIT_FAIL = - 46, ## *
                                ##  Other writer interfered during superblock is being written. This happens when
                                ##  write operation is invoked before the initialization of the file.
                                ##
    FDB_RESULT_COMPACTION_CANCELLATION = - 45, ## *
                                           ##  Fail to initialize superblock.
                                           ##
    FDB_RESULT_CRYPTO_ERROR = - 44, ## *
                                ##  Compaction task is aborted due to compaction cancellation request
                                ##  from the application.
                                ##
    FDB_RESULT_AIO_GETEVENTS_FAIL = - 43, ## *
                                      ##  Error encrypting or decrypting data, or unsupported encryption algorithm.
                                      ##
    FDB_RESULT_AIO_SUBMIT_FAIL = - 42, ## *
                                   ##  Fail to read asynchronous I/O events from the completion queue.
                                   ##
    FDB_RESULT_AIO_INIT_FAIL = - 41, ## *
                                 ##  Asynchronous I/O submit fails.
                                 ##
    FDB_RESULT_AIO_NOT_SUPPORTED = - 40, ## *
                                     ##  Asynchronous I/O init fails.
                                     ##
    FDB_RESULT_HANDLE_BUSY = - 39, ## *
                               ##  Asynchronous I/O is not supported in the current OS version.
                               ##
    FDB_RESULT_NO_DB_HEADERS = - 38, ## *
                                 ##  DB handle is being used by another thread. Forestdb handles must not be
                                 ##  shared among multiple threads.
                                 ##
    FDB_RESULT_TOO_BIG_BUFFER_CACHE = - 37, ## *
                                        ##  No commit headers in a database file.
                                        ##
    FDB_RESULT_FILE_NOT_OPEN = - 36, ## *
                                 ##  Buffer cache is too big to be configured because it is greater than
                                 ##  the physical memory available.
                                 ##
    FDB_RESULT_IN_USE_BY_COMPACTOR = - 35, ## *
                                       ##  DB file used in this operation has not been opened
                                       ##
    FDB_RESULT_INVALID_CMP_FUNCTION = - 34, ## *
                                        ##  DB file can't be destroyed as the file is being compacted.
                                        ##  Please retry in sometime.
                                        ##
    FDB_RESULT_INVALID_KV_INSTANCE_NAME = - 33, ## *
                                            ##  Custom compare function is assigned incorrectly.
                                            ##
    FDB_RESULT_KV_STORE_BUSY = - 32, ## *
                                 ##  Same KV instance name already exists.
                                 ##
    FDB_RESULT_KV_STORE_NOT_FOUND = - 31, ## *
                                      ##  There is an opened handle of the KV store.
                                      ##
    FDB_RESULT_INVALID_HANDLE = - 30, ## *
                                  ##  A KV store not found in database.
                                  ##
    FDB_RESULT_TOO_LONG_FILENAME = - 29, ## *
                                     ##  Passed ForestDB handle is Invalid.
                                     ##
    FDB_RESULT_FAIL_BY_COMPACTION = - 28, ## *
                                      ##  Filename is too long.
                                      ##
    FDB_RESULT_FAIL_BY_TRANSACTION = - 27, ## *
                                       ##  Requested FDB operation failed due to an active compaction task.
                                       ##
    FDB_RESULT_TRANSACTION_FAIL = - 26, ## *
                                    ##  Requested FDB operation failed due to active transactions.
                                    ##
    FDB_RESULT_FILE_RENAME_FAIL = - 25, ## *
                                    ##  Transaction operation fails.
                                    ##
    FDB_RESULT_FILE_REMOVE_FAIL = - 24, ## *
                                    ##  Database file rename operation fails.
                                    ##
    FDB_RESULT_FILE_IS_BUSY = - 23, ## *
                                ##  Database file remove operation fails.
                                ##
    FDB_RESULT_INVALID_COMPACTION_MODE = - 22, ## *
                                           ##  Operation cannot be performed as file handle has not been closed.
                                           ##
    FDB_RESULT_MANUAL_COMPACTION_FAIL = - 21, ## *
                                          ##  Open a file with invalid compaction mode.
                                          ##
    FDB_RESULT_INVALID_CONFIG = - 20, ## *
                                  ##  Try to perform manual compaction when compaction daemon is enabled.
                                  ##
    FDB_RESULT_FAIL_BY_ROLLBACK = - 19, ## *
                                    ##  ForestDB config value is invalid.
                                    ##
    FDB_RESULT_NO_DB_INSTANCE = - 18, ## *
                                  ##  Requested FDB operation failed as rollback is currently being executed.
                                  ##
    FDB_RESULT_COMPRESSION_FAIL = - 17, ## *
                                    ##  A database instance with a given sequence number was not found.
                                    ##
    FDB_RESULT_FILE_CORRUPTION = - 16, ## *
                                   ##  ForestDB I/O compression error.
                                   ##
    FDB_RESULT_CHECKSUM_ERROR = - 15, ## *
                                  ##  ForestDB I/O file corruption.
                                  ##
    FDB_RESULT_FSYNC_FAIL = - 14, ## *
                              ##  ForestDB I/O checksum error.
                              ##
    FDB_RESULT_SEEK_FAIL = - 13, ## *
                             ##  ForestDB I/O fsync failure.
                             ##
    FDB_RESULT_ITERATOR_FAIL = - 12, ## *
                                 ##  ForestDB I/O seek failure.
                                 ##
    FDB_RESULT_COMPACTION_FAIL = - 11, ## *
                                   ##  Database iterator operation fails.
                                   ##
    FDB_RESULT_RONLY_VIOLATION = - 10, ## *
                                   ##  Database compaction fails.
                                   ##
    FDB_RESULT_KEY_NOT_FOUND = - 9, ## *
                                ##  Read-only access violation.
                                ##
    FDB_RESULT_ALLOC_FAIL = - 8, ## *
                             ##  A key not found in database.
                             ##
    FDB_RESULT_COMMIT_FAIL = - 7, ## *
                              ##  Memory allocation fails.
                              ##
    FDB_RESULT_CLOSE_FAIL = - 6, ## *
                             ##  Database commit operation fails.
                             ##
    FDB_RESULT_READ_FAIL = - 5,  ## *
                            ##  Database close operation fails.
                            ##
    FDB_RESULT_WRITE_FAIL = - 4, ## *
                             ##  Database read operation fails.
                             ##
    FDB_RESULT_NO_SUCH_FILE = - 3, ## *
                               ##  Database write operation fails.
                               ##
    FDB_RESULT_OPEN_FAIL = - 2,  ## *
                            ##  Database file not found.
                            ##
    FDB_RESULT_INVALID_ARGS = - 1, ## *
                               ##  Database open operation fails.
                               ##
    FDB_RESULT_SUCCESS = 0      ## *
                        ##  Invalid parameters to ForestDB APIs.
                        ##

const
  FDB_RESULT_LAST = FDB_RESULT_FILE_VERSION_NOT_SUPPORTED
