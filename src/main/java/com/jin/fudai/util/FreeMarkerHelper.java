package com.jin.fudai.util;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;

import com.jin.fudai.dto.SaleOrderDto;
import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateExceptionHandler;


public class FreeMarkerHelper {
	private static final Configuration cfg;
	private static final String TEMPLATE_NAME = "fudai_sale_order.ftl";
	private static final String FTL_DIR = "/templates";
	private static final String TARGET_DIR = FreeMarkerHelper.class.getClassLoader().getResource("doc/").getPath();

	static
	{
		cfg = new Configuration(Configuration.DEFAULT_INCOMPATIBLE_IMPROVEMENTS);
		
		try {
			cfg.setClassForTemplateLoading(FreeMarkerHelper.class, FTL_DIR);
		} catch (Exception e) {
			e.printStackTrace();
		}
		cfg.setObjectWrapper(new DefaultObjectWrapper());
		cfg.setDefaultEncoding("UTF-8");
		cfg.setTemplateExceptionHandler(TemplateExceptionHandler.HTML_DEBUG_HANDLER);
	}
	
	public static Template getTemplate(String name)
	{
		try {
			return cfg.getTemplate(name);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public static void process(String targetFileName, SaleOrderDto dataModel)
	{
		try
		{
			Template template = getTemplate(TEMPLATE_NAME);
			System.out.println(TARGET_DIR + targetFileName);
			template.process(dataModel, new OutputStreamWriter(new FileOutputStream(TARGET_DIR + targetFileName)));
		}catch(Exception e)
		{
			System.out.println(e);
		}
	}
	public static void main(String[] args) throws Exception {
		SaleOrderDto saleOrder = new SaleOrderDto(null);

		process("zhansan3.docx", saleOrder);

		System.out.println("结束");
	}
}
