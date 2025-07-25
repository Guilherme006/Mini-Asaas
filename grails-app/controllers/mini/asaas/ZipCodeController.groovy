package mini.asaas

import mini.asaas.adapters.ZipCodeInfoAdapter
import mini.asaas.enums.MessageType

import grails.compiler.GrailsCompileStatic
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@GrailsCompileStatic
class ZipCodeController extends BaseController {

    ZipCodeService zipCodeService

    @Secured("permitAll")
    def find() {
        try {
            ZipCodeInfoAdapter zipCodeInfo = zipCodeService.find(params.zipCode as String)
            render([success: true, zipCodeInfo: zipCodeInfo] as JSON)
        } catch (Exception e) {
            render([success: false] as JSON)
        }
    }
}
