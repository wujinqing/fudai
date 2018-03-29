package com.jin.fudai.util;

import com.jin.fudai.entity.Product;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author wu.jinqing
 * @date 2018年03月29日
 */
public class ProductUtil {
    public static ProductSumary productSumary(List<Product> productList)
    {
        ProductSumary ps = new ProductSumary();

        if(Assert.notEmpty(productList))
        {
            Set<String> productNames = new HashSet<>();
            Set<String> productStyles = new HashSet<>();
            Set<String> productColors = new HashSet<>();

            productList.forEach(p -> {
                productNames.add(p.getName());
                productStyles.add(p.getStyle());
                productColors.add(p.getColor());
            });

            ps.setProductNames(productNames);
            ps.setProductStyles(productStyles);
            ps.setProductColors(productColors);
        }

        return ps;
    }

    public static List<Product> filterProducts(List<Product> productList, Product product)
    {
        if(Assert.notEmpty(productList) && Assert.notNull(product))
        {
            return productList.parallelStream().filter(p -> {
                if(Assert.notEmpty(product.getName()) && !product.getName().equals(p.getName())) {
                    return false;
                }

                if(Assert.notEmpty(product.getStyle()) && !product.getStyle().equals(p.getStyle())) {
                    return false;
                }

                if(Assert.notEmpty(product.getColor()) && !product.getColor().equals(p.getColor())) {
                    return false;
                }

                return  true;
            }).collect(Collectors.toList());
        }

        return productList;
    }

    public static void trimLastComma(Product product)
    {
        if(Assert.notNull(product))
        {
            product.setName(Assert.trimLastComma(product.getName()));
            product.setStyle(Assert.trimLastComma(product.getStyle()));
            product.setColor(Assert.trimLastComma(product.getColor()));
        }
    }
    public static class ProductSumary
    {
        private Set<String> productNames;
        private Set<String> productStyles;
        private Set<String> productColors;

        public Set<String> getProductNames() {
            return productNames;
        }

        public void setProductNames(Set<String> productNames) {
            this.productNames = productNames;
        }

        public Set<String> getProductStyles() {
            return productStyles;
        }

        public void setProductStyles(Set<String> productStyles) {
            this.productStyles = productStyles;
        }

        public Set<String> getProductColors() {
            return productColors;
        }

        public void setProductColors(Set<String> productColors) {
            this.productColors = productColors;
        }
    }
}
