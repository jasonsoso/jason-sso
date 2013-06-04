
package com.jason.sso.authentication.handler;

import org.jasig.cas.authentication.handler.DefaultPasswordEncoder;
import org.jasig.cas.authentication.handler.PasswordEncoder;

import junit.framework.TestCase;

public final class DefaultPasswordEncoderTests extends TestCase {
    
    private final PasswordEncoder passwordEncoder = new DefaultPasswordEncoder("MD5");

    public void testNullPassword() {
        assertEquals(null, this.passwordEncoder.encode(null));
    }

    public void testMd5Hash() {
    	assertEquals("2c14647b42fde65ede6c8c716978ec73", this.passwordEncoder
    			.encode("jasonsoso"));
        assertEquals("1f3870be274f6c49b3e31a0c6728957f", this.passwordEncoder
        		.encode("apple"));
    }
    
    public void testSha1Hash() {
        final PasswordEncoder pe = new DefaultPasswordEncoder("SHA1");
        
        final String hash = pe.encode("this is a test");
        
        assertEquals("fa26be19de6bff93f70bc2308434e4a440bbad02", hash);
        
    }
    
    public void testSha1Hash2() {
        final PasswordEncoder pe = new DefaultPasswordEncoder("SHA1");
        
        final String hash = pe.encode("TEST of the SYSTEM");
        
        assertEquals("82ae28dfad565dd9882b94498a271caa29025d5f", hash);
        
    }
    
    public void testInvalidEncodingType() {
        final PasswordEncoder pe = new DefaultPasswordEncoder("scott");
        try {
            pe.encode("test");
            fail("exception expected.");
        } catch (final Exception e) {
            return;
        }
    }
}
