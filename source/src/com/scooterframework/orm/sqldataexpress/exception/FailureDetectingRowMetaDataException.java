/*
 *   This software is distributed under the terms of the FSF 
 *   Gnu Lesser General Public License (see lgpl.txt). 
 *
 *   This program is distributed WITHOUT ANY WARRANTY. See the
 *   GNU General Public License for more details.
 */
package com.scooterframework.orm.sqldataexpress.exception;

/**
 * class FailureDetectingRowMetaDataException
 * 
 * @author (Fei) John Chen
 */
public class FailureDetectingRowMetaDataException extends BaseSQLException
{
    /**
	 * Generated serialVersionUID
	 */
	private static final long serialVersionUID = -6551858911902799882L;

	/**
     * Constructs a new FailureDetectingRowMetaDataException exception with null as its detail 
     * message. The cause is not initialized, and may subsequently be 
     * initialized by a call to Throwable.initCause(java.lang.Throwable). 
     */
    public FailureDetectingRowMetaDataException() {
        super();
    }
    
    /**
     * Constructs a new FailureDetectingRowMetaDataException exception with the specified detail 
     * message. The cause is not initialized, and may subsequently be 
     * initialized by a call to Throwable.initCause(java.lang.Throwable). 
     * 
     * @param message the detail message.
     */
    public FailureDetectingRowMetaDataException(String message) {
        super(message);
    }
    
    /**
     * Constructs a new FailureDetectingRowMetaDataException exception with the 
     * specified cause. 
     * 
     * This constructor is useful for runtime exceptions that are little more 
     * than wrappers for other throwables. 
     * 
     * @param cause the wrapped exception.
     */
    public FailureDetectingRowMetaDataException(Throwable cause) {
        super(cause);
    }
    
    /**
     * Constructs a new FailureDetectingRowMetaDataException exception with the specified 
     * detail message and cause. 
     * 
     * @param message the detail message.
     * @param cause the cause. (A null value is permitted, and indicates 
     *                          that the cause is nonexistent or unknown.)
     */
    public FailureDetectingRowMetaDataException(String message, Throwable cause) {
        super(message, cause);
    }
}
