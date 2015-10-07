package com.draftking.security;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.CookieHandler;
import java.net.CookieManager;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.Consts;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.HttpResponseException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.json.simple.JSONObject;
import org.junit.Test;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class HttpCLientTest {
	
	
	
	ResponseHandler<JSONObject> rh = new ResponseHandler<JSONObject>() {
		@Override
		public JSONObject handleResponse(final HttpResponse response)
				throws IOException {
			StatusLine statusLine = response.getStatusLine();
			HttpEntity entity = response.getEntity();
			if (statusLine.getStatusCode() >= 300) {
				throw new HttpResponseException(statusLine.getStatusCode(),
						statusLine.getReasonPhrase());
			}
			if (entity == null) {
				throw new ClientProtocolException(
						"Response contains no content");
			}
			// use GSON to convert frpm json to java object and vice versa
			Gson gson = new GsonBuilder().create();
			ContentType contentType = ContentType.getOrDefault(entity);
			Charset charset = contentType.getCharset();
			if (entity.getContentLength()==0) return null;
			Reader reader = new InputStreamReader(entity.getContent(), charset);
			
			return gson.fromJson(reader, JSONObject.class);
		}
	};

	@Test
	public void test() {
		String url = "http://100.12.28.216:8181/draftking/j_spring_security_check";
		HashMap<String, String> authenticationMap = new HashMap<String, String>();
		authenticationMap.put("j_username","benpoon");
		authenticationMap.put("j_password","pass1");
		http_execute(url, authenticationMap);
		
		//call rest endpoint	
		String url2 = "http://100.12.28.216:8181/draftking/services/playerhomestats/all";
		http_execute(url2, authenticationMap);
	}

	private void http_execute(String url,
			HashMap<String, String> requestParameters) {
		HttpClient client = HttpClientBuilder.create().build();
		CookieHandler.setDefault(new CookieManager());
		HttpPost post = new HttpPost(url);
		List<BasicNameValuePair> urlParameters = new ArrayList<BasicNameValuePair>();
		for (Map.Entry<String, String> entry : requestParameters.entrySet()) {
			urlParameters.add(new BasicNameValuePair(entry.getKey(), entry
					.getValue()));
		}
		UrlEncodedFormEntity entity = new UrlEncodedFormEntity(urlParameters,
				Consts.UTF_8);
		post.setEntity(entity);
		try {
			JSONObject jobj= client.execute(post, rh);
			if (!(jobj==null)) System.out.print(jobj.toString()); 

		}

		catch (HttpResponseException e) {
			// TODO Auto-generated catch block
			System.out.print("HttpResponseException");
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			System.out.print("ClientProtocolException");
			e.printStackTrace();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
